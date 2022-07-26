import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_project/app/controller/home/person_controller.dart';

import '../../data/model/person.dart';

class PersonPage extends GetView<PersonController> {

  @override
  Widget build(BuildContext context) {

    Person p = Get.arguments as Person;
    controller.getUserPosts(p.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("Person Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(child: Text("User Info", style: TextStyle(fontSize: 28),),),
            SizedBox(height: 20,),
            Text("${p.name}", style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 20,),
                Text("${p.email}")],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User ID:", style: TextStyle(fontSize: 22)),
                Text("${p.id}")
              ],
            ),
            Divider(height: 20,),
            Center(child: Text("Posts", style: TextStyle(fontSize: 28),) ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(controller.posts.value[p.id]?.elementAt(index).title ?? "")
                    ],
                  );
                },
                itemCount: 1,),
          ],
        ),
      ),
    );
  }
}