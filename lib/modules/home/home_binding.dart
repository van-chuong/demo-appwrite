import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_controller.dart';

import '../../provider/appwrite_provider.dart';
import '../../repository/auth_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(
        () => HomeController(AuthRepository(AppWriteProvider())));
  }
}
