import 'package:get/get.dart';
import 'package:the_project/app/data/repository/person_repository.dart';
import 'package:the_project/app/routes/routes.dart';
import '../../data/model/person.dart';
import '../../data/model/post.dart';

class PersonController extends GetxController {

  final PersonRepository personRepository = PersonRepository();
  RxBool hasLoaded = false.obs;
  var posts = <int, List<Post>>{}.obs;
  List<Person> get people => this._people.value;
  final _people = <Person>[].obs;
  void set people(value) => this._people.value = value;

  @override
  void onInit() async {
    super.onInit();
    this.people = await personRepository.getUsers();
    Get.toNamed(Routes.HOME);
  }

  Future<List<Post>> getUserPosts(int id) async {
    if(posts.value.containsKey(id)) {
      return posts.value[id] ?? <Post>[];
    }
    posts.value[id] = await personRepository.getUserPosts(id);
    return posts.value[id] ?? <Post>[];
  }
}