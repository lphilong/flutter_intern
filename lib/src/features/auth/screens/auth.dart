import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/common_widgets/custom_submit-btn.dart';
import 'package:work/src/features/auth/screens/login.dart';
import 'package:work/src/features/auth/screens/register.dart';
import '../../../common_widgets/drawer.dart';
import '../../../utils/colors.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(color: hexStringToColor("eed5b7")),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              submitBtn(context, true, () => Get.to(() => const Login())),
              submitBtn(context, false, () => Get.to(() => const Register()))
            ]),
          ),
        ),
        drawer: const CustomDrawer());
  }
}
