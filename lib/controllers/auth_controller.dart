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
          password: password);
      http.Response response = await http.post(Uri.parse('$url/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json, charset=UTF-8'
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been created for you');
          });
    } catch (err) {}
  }
}
