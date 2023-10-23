import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_binding.dart';
import 'package:mobile_app/modules/home/home_view.dart';
import 'package:mobile_app/modules/login/login_binding.dart';
import 'package:mobile_app/modules/login/login_view.dart';
import 'package:mobile_app/modules/splash/splash_binding.dart';
import 'package:mobile_app/modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
