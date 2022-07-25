import 'package:flutter/material.dart';
import 'package:the_project/home_page.dart';
import 'package:the_project/loading_page.dart';
import 'package:the_project/person_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => LoadingPage(),
      '/home': (context) => HomePage()
    },
  ));
}
