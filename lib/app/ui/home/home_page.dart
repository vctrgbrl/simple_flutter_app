import 'package:flutter/material.dart';
import 'package:the_project/app/controller/home/person_controller.dart';
import 'package:the_project/app/data/model/person.dart';
import 'package:get/get.dart';
import 'package:the_project/app/routes/routes.dart';
import 'package:the_project/app/ui/person/person_page.dart';

class HomePage extends GetView<PersonController> {
  Widget PersonCard(Person p) {
    return GestureDetector(
      onTap: () {Get.toNamed(Routes.PERSON, arguments: p);},
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

    // List<Person>? data = ModalRoute.of(context)?.settings.arguments as List<Person>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
      ),
      body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: controller.people.map((p) => PersonCard(p)).toList(),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {},
      ),
    );
  }
}