import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class RegisterController extends GetxController {
  static RegisterController instance = Get.find();
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController name, email, password, confirmPassword;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  String? validateUserName(String? text) {
    if (text == null || text.isEmpty) {
      return 'Username is required';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
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

  String? validateConfirmedPassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }
    if (text != password.text) {
      return 'password does not match!';
    }
    return null;
  }

  handleRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var data = await AuthService.register(
            name: name.text,
            email: email.text,
            password: password.text,
            confirmPassword: confirmPassword.text);
        if (data != null) {
          await ApiHandler.storeToken(data["token"]);
          registerFormKey.currentState!.save();
          Get.to(const AuthenticationScreen());
        } else {
          Get.snackbar('register', 'Something went wrong');
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
