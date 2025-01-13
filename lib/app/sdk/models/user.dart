class UserModel {
  String? message;
  String? token;

  UserModel({this.message, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}
