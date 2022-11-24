import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController email, password;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z)(?=.*?[0-9)(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Password must be at least 8 characters\nInclude an uppercase letter, number and symbol';
    }

    return null;
  }

  handleLogin() async {
    bool isValidate = loginFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var data = await AuthService.login(
          email: email.text,
          password: password.text,
        );
        if (data != null) {
          await ApiHandler.storeToken(data["token"]);
          loginFormKey.currentState!.save();
          Get.to(const AuthenticationScreen());
        } else {
          Get.snackbar('login', 'Something went wrong');
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
