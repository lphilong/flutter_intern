import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/screens/register.dart';

Row registerOption() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have account?",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => const Register());
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.lightBlue, decoration: TextDecoration.underline),
          ),
        ),
      )
    ],
  );
}
