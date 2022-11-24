import 'package:get/get.dart';
import 'package:work/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:work/src/common_widgets/custom_submit-btn.dart';
import 'package:work/src/common_widgets/custom_textfield.dart';
import 'package:work/src/constants/controllers.dart';

class Login extends StatelessWidget {
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
          decoration: BoxDecoration(color: hexStringToColor("eed5b7")),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: loginController.loginFormKey,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          inputForm(
                              "Enter Email",
                              Icons.mail_outline,
                              false,
                              loginController.email,
                              loginController.validateEmail),
                          const SizedBox(
                            height: 30,
                          ),
                          inputForm(
                              "Enter Password",
                              Icons.lock_outline,
                              true,
                              loginController.password,
                              loginController.validatePassword),
                          const SizedBox(
                            height: 30,
                          ),
                          Obx((() => loginController.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(""))),
                          submitBtn(context, true, () {
                            loginController.handleLogin();
                          }),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
