import 'package:flutter/material.dart';
import 'package:work/src/features/auth/controllers/appController.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import 'package:work/src/features/auth/screens/login.dart';
import 'package:work/src/features/auth/screens/register.dart';
import './src/constants/firebase.dart';
import 'package:get/get.dart';
import './src/features/auth/controllers/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(UserController());
    Get.put(AppController());
  });
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
