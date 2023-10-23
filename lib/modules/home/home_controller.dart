import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/models/trashtype_model.dart';
import 'package:mobile_app/repository/auth_repository.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:appwrite/models.dart' as models;
import 'package:snackbar/snackbar.dart';

import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  AuthRepository authRepository;
  HomeController(this.authRepository);
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  final trashTypeList =[].obs;
  User? currentUser;
  RxBool isLoading = true.obs;
  @override
  onInit() async {
    await authRepository.getCurrentUser().then((value) {
      currentUser = value;
      isLoading(false);
    });
    await getTrashType();
    super.onInit();
  }

  void openCloseSideMenu() {
    if (sideMenuKey.currentState!.isOpened) {
      sideMenuKey.currentState!.closeSideMenu();
    } else {
      sideMenuKey.currentState!.openSideMenu();
    }
  }

  Future<void> getTrashType() async {
    final documents = await authRepository.getTrashType();
    if (documents != null && documents.documents != null) {
      trashTypeList.assignAll(
        documents.documents.map((doc) => TrashType.fromMap(doc.data)),
      );
    } else {
      trashTypeList.clear();
    }
  }

  logout(){
    authRepository.logOut();
    snack("Logging Out.......");
    Future.delayed(Duration(seconds: 1), () => Get.offAllNamed(Routes.login));
  }
}
