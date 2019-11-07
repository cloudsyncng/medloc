import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';

abstract class PatientsRepository {
  Future<Either<Failures, Patient>> getPatient(String phone, String password);
  Future<Either<Failures, bool>> regPatient(Patient patient);
}
