import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.text),
      ),
    );
  }
}
