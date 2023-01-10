import 'package:flutter/material.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';
import 'package:work/src/features/auth/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:work/src/routing/routes.dart';

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
      initialRoute: AppRoutes.auth,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
