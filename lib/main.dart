import 'package:flutter/material.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';
import 'package:work/src/features/auth/controllers/register_controller.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(LoginController());
  Get.put(RegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationScreen(),
    );
  }
}
