import 'package:automex_store/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<User?> {
  //constrcutor initialising with default User object
  //purpose: Manage the state of the user object allowing update
  UserProvider()
      : super(
          User(
              id: '',
              fullname: '',
              email: '',
              state: '',
              locality: '',
              password: '',
              token: ''),
        );

  //Getter method to extract value from an object
  User? get user => state;
  //Setter method to update the state of the user object
  void setUser(String userJson) {
    state = User.fromJson(userJson);
  }

  //make the user object accissible to other classes
  final userProvider =
      StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());
}
