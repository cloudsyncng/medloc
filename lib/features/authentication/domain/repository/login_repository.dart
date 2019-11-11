import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/authentication/domain/entity/login_credential.dart';

abstract class LoginRepository {
  Future<Either<Failures, Patient>> login(LoginCredential loginCredential);
}