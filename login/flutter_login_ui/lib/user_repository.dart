import 'dart:convert';

import 'package:flutterloginui/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel> fetchUser(String account, String password) async {
    final http.Response response = await http.post(
        'http://10.0.2.2:3131/users/signin',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'account': account, 'password': password}));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Không load được dữ liệu');
    }
  }
}
