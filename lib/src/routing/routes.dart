import 'package:get/get.dart';
import 'package:work/src/bindings/register_binding.dart';
import 'package:work/src/bindings/login_binding.dart';
import 'package:work/src/bindings/user_binding.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import 'package:work/src/features/auth/screens/login.dart';
import 'package:work/src/features/auth/screens/register.dart';
import 'package:work/src/features/search/screens/search_screen.dart';
import 'package:work/src/features/search/screens/type.dart';

class AppRoutes {
  static const auth = Routes.auth;
  static const search = Routes.search;
  static const login = Routes.login;
  static const register = Routes.register;
  static const type = Routes.type;

  static final routes = [
    GetPage(name: Routes.auth, page: () => const AuthenticationScreen()),
    GetPage(
        name: Routes.search,
        page: () => const SearchScreen(),
        binding: LoginBiding()),
    GetPage(
        name: Routes.login, page: () => const Login(), binding: LoginBiding()),
    GetPage(
        name: Routes.register,
        page: () => const Register(),
        binding: RegisterBinding()),
    GetPage(name: Routes.type, page: () => const TypeScreen()),
  ];
}

class Routes {
  static const auth = '/auth';
  static const search = '/search';
  static const login = '/login';
  static const register = '/register';
  static const type = '/type';
}
