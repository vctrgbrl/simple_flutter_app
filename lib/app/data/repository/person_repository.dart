import 'package:the_project/app/data/model/post.dart';

import '../model/person.dart';
import '../provider/person_provider.dart';

class PersonRepository {
  final PersonProvider personProvider = PersonProvider();

  Future<List<Person>> getUsers() {
    return personProvider.getUsers();
  }

  Future<List<Post>> getUserPosts(int id) {
    return personProvider.getUserPosts(id);
  }
}