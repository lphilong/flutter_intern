import 'package:work/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:work/src/common_widgets/custom_submit-btn.dart';
import 'package:work/src/common_widgets/custom_textfield.dart';
import '../widgets/registerOption.dart';
import 'package:work/src/constants/controllers.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                inputForm("Enter Email", Icons.person_outline, false,
                    userController.email, null),
                const SizedBox(
                  height: 30,
                ),
                inputForm("Enter Password", Icons.lock_outline, true,
                    userController.password, null),
                const SizedBox(
                  height: 30,
                ),
                submitBtn(context, true, userController.signIn),
                registerOption()
              ]),
        ),
      ),
    );
  }
}
