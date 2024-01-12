class UserModel {

  final String? id_user;
  final String? username;
  final String? full_name;
  final String? user_password;
  final String? created_date;
  final String? modify_date;

  UserModel({this.id_user, this.username, this.full_name, this.user_password, this.created_date, this.modify_date});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id_user: json['id_user'],
      username: json['user_name'],
      full_name: json['full_name'],
      user_password: json['user_password'],
      created_date: json['created_date'],
      modify_date: json['modify_date'],
    );
  }
}