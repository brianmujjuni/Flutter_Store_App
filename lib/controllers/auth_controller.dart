import 'dart:convert';

import 'package:automex_store/global_variables.dart';
import 'package:automex_store/models/user.dart';
import 'package:automex_store/provider/user_provider.dart';
import 'package:automex_store/services/manage_http_response.dart';
import 'package:automex_store/views/screens/authentication/login_screen.dart';
import 'package:automex_store/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final providerContainer = ProviderContainer();
class AuthController {
  Future<void> signupUsers(
      {required context,
      required String email,
      required String fullname,
      required String password}) async {
    try {
      User user = User(
          id: '',
          fullname: fullname,
          email: email,
          state: '',
          locality: '',
          password: password,
          token: '');
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            showSnackBar(context, 'Account has been created for you');
          });
    } catch (err) {
      print(err);
    }
  }

  //signin user function
  Future<void> signInUser(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode(
            {'email': email, 'password': password},
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      //handle response using the managehttpresponse
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: ()async {
            //Access the sharedPreferences for token and user data storage
            SharedPreferences preferences = await SharedPreferences.getInstance();
            // Extract the authentication token from the response
            String token = jsonDecode(response.body)['token'];
            //Store the token in shared preferences
            await preferences.setString('auth_token', token);
            //Encode the user data received from the response as json
            final userJson = jsonEncode(jsonDecode(response.body)['user']);

            // update the application state with the user data using riverpod
            providerContainer.read(userProvider.notifier).setUser(userJson);
            // store the user data in shared preferences for future use
            await preferences.setString('user', userJson);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
            showSnackBar(context, 'You have successfully signed In');
          });
    } catch (err) {
      print(err);
    }
  }
  //signout user function
  Future<void>signOutUser({required context})async{
    try{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      //clear the token and user data from shared preferences
      await preferences.remove('auth_token');
      await preferences.remove('user');
     //Clear the user state in the provider
      providerContainer.read(userProvider.notifier).signout();
      //Navigate to the login screen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
      showSnackBar(context, 'You have successfully signed out');
    }catch(err){
      showSnackBar(context, 'Error signing out');
    }
  }
}
