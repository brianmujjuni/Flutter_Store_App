import 'dart:convert';

import 'package:automex_store/global_variables.dart';
import 'package:automex_store/models/user.dart';
import 'package:automex_store/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

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
          response: response, context: context, onSuccess: () {
            showSnackBar(context, 'You have successfully signed In');
          });
    } catch (err) {
      print(err);
    }
  }
}
