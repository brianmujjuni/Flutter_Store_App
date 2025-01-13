import 'package:automex_store/models/user.dart';
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
          password: password);

    } catch (err) {}
  }
}
