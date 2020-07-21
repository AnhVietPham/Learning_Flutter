class UserModel {
  final String account;
  final String fullname;
  final String password;

  UserModel({this.account, this.fullname, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        account: json['account'],
        fullname: json['fullname'],
        password: json['password']);
  }
}
