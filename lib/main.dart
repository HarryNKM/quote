import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quotes/screen/home/controller/home_controller.dart';
import 'package:quotes/utils/routes.dart';
HomeController controller=HomeController();
void main() {

  runApp( Obx(
    ()=> GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: controller.themeData.value == true
          ? ThemeMode.light
          : ThemeMode.dark,
    ),
  ));
}

