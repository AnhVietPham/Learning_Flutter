import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable{
  LoginEvent();
}

class LoginButtonPressed extends LoginEvent{
  final String account;
  final String password;

  LoginButtonPressed({@required this.account, @required this.password});

  @override
  List<Object> get props => [account, password];

  @override
  String toString() => 'LoginButtonPressed: {account: $account}';
}