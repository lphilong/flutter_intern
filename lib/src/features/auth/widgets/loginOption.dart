import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/screens/login.dart';

Row loginOption() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have account?",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => const Login());
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.lightBlue, decoration: TextDecoration.underline),
          ),
        ),
      )
    ],
  );
}
