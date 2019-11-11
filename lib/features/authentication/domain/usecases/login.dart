import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/authentication/domain/entity/login_credential.dart';
import 'package:med_plus/features/authentication/domain/repository/login_repository.dart';

class Login{
  final LoginRepository repository;

  Login({this.repository});

  Future<Either<Failures, Patient>> call({@required LoginCredential loginCredential}){
    return repository.login(loginCredential);
  }
}