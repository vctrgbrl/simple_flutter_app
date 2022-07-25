class Person {
  int id;
  String name;
  String email;
  Gender gender;
  Status status;

  Person(this.id, this.name, this.email, this.gender, this.status);
}

enum Gender {
  female, male
}

enum Status {
  inactive, active
}