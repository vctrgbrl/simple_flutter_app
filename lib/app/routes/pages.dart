import 'package:get/get.dart';
import 'package:the_project/app/routes/routes.dart';
import 'package:the_project/app/ui/home/home_page.dart';
import 'package:the_project/app/ui/loading/loading_page.dart';
import 'package:the_project/app/ui/person/person_page.dart';

class Pages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => LoadingPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.PERSON, page: () => PersonPage())
  ];
}