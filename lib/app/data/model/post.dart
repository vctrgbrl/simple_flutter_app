class Post {
  late String title;
  late String body;

  Post(Map<String, dynamic> json) {
    this.title = json['title'];
    this.body = json['body'];
  }
}