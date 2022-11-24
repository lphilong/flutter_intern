import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../constants/controllers.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'api_service.dart';

class AuthService {
  static login({
    required email,
    required password,
  }) async {
    LoginModel loginModel = LoginModel(
        email: registerController.email.text,
        password: registerController.password.text);
    var res = await ApiHandler.post(loginModelToJson(loginModel), "register");
    var data = json.decode(res);
    return data;
  }

  static register(
      {required name,
      required email,
      required password,
      required confirmPassword}) async {
    RegisterModel registerModel = RegisterModel(
        email: registerController.email.text,
        password: registerController.password.text);
    var res =
        await ApiHandler.post(registerModelToJson(registerModel), "register");
    var data = json.decode(res);
    return data;
  }
}
