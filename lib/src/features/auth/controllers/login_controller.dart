import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/services/auth_service.dart';
import 'package:work/src/features/search/screens/search_screen.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController, passwordController;
  final storage = const FlutterSecureStorage();
  RxString? token;
  UserModel? userModel;
  RxString dropdownValue = 'zero'.obs;
  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getUser();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    /*String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Invalid Email';
    }*/
    return null;
  }

  String? emptyMessage() {
    return 'Field is required';
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    /* String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z)(?=.*?[0-9)(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Password must be at least 8 characters\nInclude an uppercase letter, number and symbol';
    }*/

    return null;
  }

  getUser() async {
    var scopedToken = await ApiHandler.getToken();
    if (scopedToken != null) {
      token?.value = scopedToken;
      var res = await ApiHandler.get('usersInfo', scopedToken);
      userModel = UserModel.fromJson(json.decode(res));
    }
  }

  void login() async {
    bool isValidate = loginFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var res = await AuthServices.login(
            username: usernameController, password: passwordController);
        var data = jsonDecode(res);
        if (data['status'] == 401) {
          Get.snackbar('Login Failed', data['message']);
        } else {
          loginFormKey.currentState!.save();
          await ApiHandler.storeToken(data['token']);
          Get.snackbar('Login', 'Login success');
          Future.delayed(const Duration(seconds: 2), () {
            Get.to(() => const SearchScreen());
          });
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
