import 'package:get/get.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
