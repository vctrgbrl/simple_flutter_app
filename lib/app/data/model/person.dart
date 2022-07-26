import "post.dart";

class Person {
  late int id;
  late String name;
  late String email;
  late Gender gender;
  late Status status;
  List<Post> posts = [];

  Person(this.id, this.name, this.email, this.gender, this.status);

  Person.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.gender = Gender.female;
    this.status = Status.inactive;
    if (json['gender'] != 'female') {
      this.gender = Gender.male;
    }
    if (json['status'] != 'inactive') {
      this.status = Status.active;
    }
  }
}

enum Gender {
  female, male
}

enum Status {
  inactive, active
}