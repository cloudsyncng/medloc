import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Empty extends AuthState {
  @override
  List<Object> get props => [];
}


class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class Loaded extends AuthState {
  @override
  List<Object> get props => [];
}

class Error extends AuthState {
  @override
  List<Object> get props => [];
}