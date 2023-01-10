import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/services/auth_service.dart';
import 'package:work/src/routing/routes.dart';
import '../services/api_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController,
      emailController,
      passwordController,
      confirmPasswordController,
      firstnameController,
      lastnameController;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  String? validateUserName(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    } /*
    if (text.length < 4) {
      return 'Too short';
    }*/
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required';
    }
    /*String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return 'Invalid Email';
    }*/
    return null;
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

  String? emptyMessage() {
    return 'Field is required';
  }

  String? validateConfirmedPassword(String? text) {
    if (text == null || text.isEmpty) {
      return emptyMessage();
    }
    if (text != passwordController.text) {
      return 'password does not match!';
    }
    return null;
  }

  void clear() {
    usernameController.clear();
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  handleRegister() async {
    bool isValidate = registerFormKey.currentState!.validate();

    if (isValidate) {
      isLoading(true);
      try {
        var res = await AuthServices.register(
            username: usernameController,
            password: passwordController,
            firstName: firstnameController,
            lastName: lastnameController,
            email: emailController);
        var data = jsonDecode(res);
        if (data['status'] == 400) {
          Get.snackbar('Register Failed', data['message']);
        } else {
          await ApiHandler.storeToken(data['token']);
          registerFormKey.currentState!.save();
          Get.snackbar('Register', 'Register success');
          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed(AppRoutes.search);
          });
          clear();
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
