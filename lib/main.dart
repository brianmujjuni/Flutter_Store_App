import 'package:automex_store/provider/user_provider.dart';
import 'package:automex_store/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:automex_store/views/screens/authentication/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //Run the flutter app wrapped in a providerscope for managing state
  runApp(ProviderScope(child: const MyApp()));
}

//Root widget of the application , a consumerwidget to consume state change
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
//Method to check the token and set the user data if available
  Future<void> _checkTokenAndSetUser(WidgetRef ref) async {
    //obtain an instance of sharedPreference for local data storage
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //Retrieve the authentication token and user data stored locally
    String? token = preferences.getString('auth_token');
    String? userJson = preferences.getString('user');
    if (token != null && userJson != null) {
      //If token and user data are available, set the user data in the provider
      ref.read(userProvider.notifier).setUser(userJson);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Automex Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
          future: _checkTokenAndSetUser(ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = ref.watch(userProvider);
            return user != null ? MainScreen() : LoginScreen();
          }),
    );
  }
}
