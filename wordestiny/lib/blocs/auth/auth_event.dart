import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();
}

class Login extends AuthEvent {  //此处暂设为极光一键登录
  Login(this.phoneNum, this.password);

  final String phoneNum;
  final String password;

  @override
  List<Object?> get props => [phoneNum, password];
}

class Unauthorize extends AuthEvent {
  Unauthorize();

  @override
  List<Object?> get props => [];
}