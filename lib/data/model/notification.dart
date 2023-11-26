class notificationModel {
  int? id;
  String? title;
  String? body;
  int? userId;
  String? date;

  notificationModel({this.id, this.title, this.body, this.userId});

  notificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['user_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['date'] = this.date;
    return data;
  }
}
