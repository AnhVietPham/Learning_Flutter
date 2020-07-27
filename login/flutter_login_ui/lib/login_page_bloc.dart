import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterloginui/base_response.dart';
import 'package:flutterloginui/login_event.dart';
import 'package:flutterloginui/login_state.dart';
import 'package:flutterloginui/user_model.dart';
import 'package:flutterloginui/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      try {
        final BaseResponseModel<UserModel> userResponseModel =
            await userRepository.fetchUser(event.account, event.password);

        if (userResponseModel.isSuccess) {
          print('{account: ${userResponseModel.dataSuccess.account}, fullname: ${userResponseModel.dataSuccess.fullName}');
        } else {
          print(userResponseModel.errors);
        }

        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
