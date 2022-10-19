import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  const AuthState();
}

class UserInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class UserLogging extends AuthState {
  @override
  List<Object> get props => [];
}

class UserLogged extends AuthState{

  final Data data;

  UserLogged(this.data);

  @override
  List<Object?> get props => [data];
}

class UserLoginFail extends AuthState{
  @override
  List<Object?> get props => [];
}