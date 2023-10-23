import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/repository/auth_repository.dart';
import 'package:snackbar/snackbar.dart';

import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  AuthRepository authRepository;

  LoginController(this.authRepository);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isEmailValid = true.obs;
  final RxBool isPasswordValid = true.obs;

  //final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void login(String email, String password) async {
    try{
      await authRepository
          .logIn({'email': email, 'password': password}).then((value) {
        snack("Logged in successfully. Redirecting to Home .......");
        Future.delayed(Duration(seconds: 1), () => Get.offAllNamed(Routes.home));
      }).catchError((error) {
        if (error is AppwriteException){
          snack(error.response['message']);
        }else{
          snack("Something went wrong");
        }
      });
    } catch(error){
      snack("Something went wrong");
    };
  }
}
