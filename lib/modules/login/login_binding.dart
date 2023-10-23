import 'package:get/get.dart';
import 'package:mobile_app/modules/login/login_controller.dart';
import 'package:mobile_app/provider/appwrite_provider.dart';
import 'package:mobile_app/repository/auth_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(AuthRepository(AppWriteProvider())));
  }
}
