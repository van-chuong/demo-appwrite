import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'AppWrite Demo Application',
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
  ));
}
