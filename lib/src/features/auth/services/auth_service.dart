import '../models/login_model.dart';
import '../models/register_model.dart';
import 'api_service.dart';

class AuthServices {
  static login({required username, required password}) async {
    LoginModel loginModel =
        LoginModel(username: username.text, password: password.text);
    var res = await ApiHandler.post(loginModelToJson(loginModel), "login");
    return res;
  }

  static register(
      {required username,
      required password,
      required firstName,
      required lastName,
      required email}) async {
    RegisterModel registerModel = RegisterModel(
        username: username.text,
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text);
    var res =
        await ApiHandler.post(registerModelToJson(registerModel), "register");
    return res;
  }
}
