import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/common_widgets/custom_submit-btn.dart';
import 'package:work/src/common_widgets/custom_textfield.dart';
import 'package:work/src/constants/controllers.dart';
import '../../../utils/colors.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
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
                  key: registerController.registerFormKey,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          inputForm(
                              "Enter Username",
                              Icons.person_outline,
                              false,
                              registerController.name,
                              registerController.validateUserName),
                          const SizedBox(
                            height: 30,
                          ),
                          inputForm(
                              "Enter Email",
                              Icons.mail_outline,
                              false,
                              registerController.email,
                              registerController.validateEmail),
                          const SizedBox(
                            height: 30,
                          ),
                          inputForm(
                              "Enter Password",
                              Icons.lock_outline,
                              true,
                              registerController.password,
                              registerController.validatePassword),
                          const SizedBox(
                            height: 30,
                          ),
                          inputForm(
                              "Re-enter Password",
                              Icons.lock_outline,
                              true,
                              registerController.confirmPassword,
                              registerController.validateConfirmedPassword),
                          Obx((() => registerController.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(""))),
                          const SizedBox(
                            height: 30,
                          ),
                          submitBtn(context, false, () {
                            registerController.handleRegister();
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
