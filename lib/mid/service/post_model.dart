class PostModel {
  int? userId;
  String? title;
  String? body;
  int? id;

  PostModel({this.userId, this.title, this.body, this.id});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['title'] = title;
    data['body'] = body;
    data['id'] = id;
    return data;
  }
}
