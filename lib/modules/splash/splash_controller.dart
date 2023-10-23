import 'package:get/get.dart';
import 'package:mobile_app/repository/auth_repository.dart';
import 'package:mobile_app/routes/app_routes.dart';

class SplashController extends GetxController {
  final text = "Splash Screen";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 2), () => Get.offAllNamed(Routes.login));
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
