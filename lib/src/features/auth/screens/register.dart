import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/common_widgets/custom_authInput.dart';
import 'package:work/src/features/auth/controllers/register_controller.dart';
import '../../../common_widgets/gradient_btn.dart';
import '../../../constants/constants.dart';

class Register extends GetView<RegisterController> {
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
                  key: controller.registerFormKey,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const NewWidget(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class NewWidget extends GetView<RegisterController> {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputForm("Username", Icons.person_outline, false,
              controller.usernameController, controller.validateUserName),
          const SizedBox(
            height: 30,
          ),
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: inputForm(
                        'First Name',
                        Icons.person_outline,
                        false,
                        controller.firstnameController,
                        controller.validateUserName)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: inputForm(
                        'Last Name',
                        Icons.person_outline,
                        false,
                        controller.lastnameController,
                        controller.validateUserName)),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          inputForm("Email", Icons.mail_outline, false,
              controller.emailController, controller.validateEmail),
          const SizedBox(
            height: 30,
          ),
          inputForm("Password", Icons.lock_outline, true,
              controller.passwordController, controller.validatePassword),
          const SizedBox(
            height: 30,
          ),
          inputForm(
              "Re-enter Password",
              Icons.lock_outline,
              true,
              controller.confirmPasswordController,
              controller.validateConfirmedPassword),
          Obx((() => controller.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : const Text(""))),
          const SizedBox(
            height: 30,
          ),
          GradientButton(
              onTap: () {
                controller.handleRegister();
              },
              text: 'Sign Up'),
        ]);
  }
}
