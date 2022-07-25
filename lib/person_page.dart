import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'person.dart';

class PersonPage extends StatefulWidget {

  final Person? person;

  const PersonPage({ this.person, Key? key}) : super(key: key);
  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  List<Post> posts = [];

  void getUserPosts() async {
    Uri uri = Uri.parse("https://gorest.co.in/public/v2/users/${widget.person?.id}/posts");
    Response res = await get(uri);
    List data = jsonDecode(res.body);
    for (var el in data) {
      posts.add(Post(el['title'], el['body']));
    }
    if(!mounted) return;
    setState(() {
      posts;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserPosts();
  }

  @override
  Widget build(BuildContext context) {
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
            Text("${widget.person?.name}", style: TextStyle(fontSize: 24),),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 20,),
                Text("${widget.person?.email}")],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User ID:", style: TextStyle(fontSize: 22)),
                Text("${widget.person?.id}")
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
                    Text("${posts[index].title}")
                  ],
                );
              },
              itemCount: posts.length,)
          ],
        ),
      ),
    );
  }
}

class Post {
  String title;
  String body;

  Post(this.title, this.body);
}
