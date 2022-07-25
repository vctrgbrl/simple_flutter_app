import 'package:flutter/material.dart';
import 'package:the_project/person.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:the_project/person_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> people = [];

  void getData() async {
    people = [];
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
      setState(() {
        people;
      });
    }
    setState(() {
      people;
    });
  }

  Widget PersonCard(Person p) {
    return GestureDetector(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PersonPage(person: p,)));},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: p.status==Status.active?Colors.green[400]:Colors.grey[400],),
              SizedBox(width: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name, style: TextStyle(fontSize: 24.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<Person>? data = ModalRoute.of(context)?.settings.arguments as List<Person>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
      ),
      body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: data?.map((p) => PersonCard(p)).toList() ?? [],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: getData,
      ),
    );
  }
}