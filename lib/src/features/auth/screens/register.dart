import 'package:work/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:work/src/common_widgets/custom_submit-btn.dart';
import 'package:work/src/common_widgets/custom_textfield.dart';
import '../widgets/loginOption.dart';
import 'package:work/src/constants/controllers.dart';

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
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: userController.formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            inputForm(
                                "Enter Username",
                                Icons.person_outline,
                                false,
                                userController.userName,
                                userController.validateUserName),
                            const SizedBox(
                              height: 30,
                            ),
                            inputForm(
                                "Enter Email",
                                Icons.mail_outline,
                                false,
                                userController.email,
                                userController.validateEmail),
                            const SizedBox(
                              height: 30,
                            ),
                            inputForm(
                                "Enter Password",
                                Icons.lock_outline,
                                true,
                                userController.password,
                                userController.validatePassword),
                            const SizedBox(
                              height: 30,
                            ),
                            inputForm(
                                "Re-enter Password",
                                Icons.lock_outline,
                                true,
                                userController.confirmPassword,
                                userController.validateConfirmedPassword),
                            const SizedBox(
                              height: 30,
                            ),
                            submitBtn(
                                context, false, userController.createUser),
                            loginOption()
                          ]),
                    ),
                  ),
                ),
              ),
            )));
  }
}
