import '../model/person.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../model/post.dart';

class PersonProvider {

  PersonProvider();

  Future<List<Person>> getUsers() async {
    List<Person> people = <Person>[];
    Uri uri = Uri.parse('https://gorest.co.in/public/v2/users');
    Response res = await get(uri);
    List data = jsonDecode(res.body);
    for (var element in data) {
      people.add(Person.fromJson(element));
    }
    return people;
  }

  Future<List<Post>> getUserPosts(int id) async {
    List<Post> posts = <Post>[];
    Uri uri = Uri.parse("https://gorest.co.in/public/v2/users/$id/posts");
    Response res = await get(uri);
    List data = jsonDecode(res.body);
    for (var element in data) {
      posts.add(Post(element));
    }
    return posts;
  }
}