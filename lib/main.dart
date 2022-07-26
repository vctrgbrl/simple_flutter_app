import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_project/app/routes/pages.dart';
import 'package:the_project/app/routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.INITIAL,
    getPages: Pages.routes,
  ));
}
