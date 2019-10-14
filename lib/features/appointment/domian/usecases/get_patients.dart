import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/repositories/patient_repository.dart';

class GetPatient {
  final PatientRepository repository;

  GetPatient(this.repository);

  Future<Either<Failures, Patient>> call({@required int id}) async {
    return await repository.getPatient(id);
  }
}
