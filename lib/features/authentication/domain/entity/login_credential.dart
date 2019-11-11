import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginCredential extends Equatable {
  final String phone;
  final String password;

  LoginCredential({
    @required this.phone,
    @required this.password,
  }) : super([
          phone,
          password,
        ]);
}
