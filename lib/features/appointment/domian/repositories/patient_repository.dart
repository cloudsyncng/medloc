import 'package:dartz/dartz.dart';
import 'package:med_plus/core/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';

abstract class PatientRepository {
  Future<Either<Failures, Patient>> getPatient(int id);
  Future<Either<Failures, bool>> postPatient(Patient patient);
}
