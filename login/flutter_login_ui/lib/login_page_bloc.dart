import 'dart:async';

import 'package:flutterloginui/bloc.dart';
import 'package:flutterloginui/user_model.dart';
import 'package:flutterloginui/user_repository.dart';

class LoginPageBloc implements Bloc {
  final _loginController = StreamController<UserModel>();

  Stream<UserModel> get loginStream => _loginController.stream;

  final _userRepository = UserRepository();


  void login(String account, String password) {
    final user = _userRepository.fetchUser(account, password);
    user.then((value) => {
      print('Flutter-Login: Account = ${value.account}, FullName = ${value.fullname}, Password = ${value.password}')
    });
    user.catchError( (err) => {
      print('Flutter-Login: $err')
    });
  }


  @override
  void dispose() {
    _loginController.close();
  }
}