import 'package:flutter/material.dart';
import 'package:the_project/app/controller/home/person_controller.dart';
import 'package:get/get.dart';
import 'package:the_project/app/ui/home/home_page.dart';

class LoadingPage extends GetView<PersonController> {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Get.put(PersonController());
    return Scaffold(
      body: Center(child: Image.asset("images/uff-logo.png"),),
    );
  }
}
