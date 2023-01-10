import 'package:get/get.dart';
import 'package:work/src/common_widgets/gradient_btn.dart';
import 'package:work/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:work/src/common_widgets/custom_authInput.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Pallete.backgroundColor),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: controller.loginFormKey,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          inputForm(
                              "Enter Email",
                              Icons.mail_outline,
                              false,
                              controller.usernameController,
                              controller.validateEmail),
                          const SizedBox(
                            height: 30,
                          ),
                          inputForm(
                              "Enter Password",
                              Icons.lock_outline,
                              true,
                              controller.passwordController,
                              controller.validatePassword),
                          const SizedBox(
                            height: 30,
                          ),
                          Obx((() => controller.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(""))),
                          GradientButton(
                              onTap: () {
                                controller.login();
                              },
                              text: 'Login')
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
