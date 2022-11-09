import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/utils/showLoading.dart';
import 'package:work/src/features/auth/models/authModel.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  RxBool isLoggedIn = false.obs;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      return 'Password must be atleast 8 characters\nInclude an uppercase letter, number and symbol';
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

  Future<void> signIn() async {
    try {
      await Auth()
          .signIn(email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  Future<void> createUser() async {
    try {
      if (formKey.currentState!.validate()) {
        await Auth()
            .createUser(
                email: email.text.trim(), password: password.text.trim())
            .then((result) {
          _clearControllers();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign up Failed", "Try again");
    }
  }

  Future<void> signOut() async {
    Auth().signOut();
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
