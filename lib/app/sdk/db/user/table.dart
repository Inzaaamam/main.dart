class UserTable {
  static const userTable = 'user';
  static const id = 'id';
  static const usertoken = 'token';
  final String token;
  UserTable.create({required this.token});
  UserTable.update({required this.token});
  UserTable.fromJson(Map<String, dynamic> data) : token = data['token'];
  UserTable.fromMap(Map<String, dynamic> data) : token = data['token'];
  Map<String, dynamic> toJson() {
    return {
      usertoken: token,
    };
  }
}
