import 'package:flutter/material.dart';
import 'package:the_project/person.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void getData() async {
    List<Person> people = [];
    Uri uri = Uri.parse('https://gorest.co.in/public/v2/users');
    Response res = await get(uri);
    List data = jsonDecode(res.body);
    for (var element in data) {
      Gender g = Gender.male;
      Status s = Status.active;
      if(element['gender'] == 'female') {
        g = Gender.female;
      }
      if(element['status'] == 'inactive') {
        s = Status.inactive;
      }
      people.add(Person(element['id'], element['name'],element['email'], g, s));
    }
    Navigator.pushReplacementNamed(context, '/home', arguments: people);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
            image: AssetImage('images/uff-logo.png'),
          )
      ),
    );
  }
}
