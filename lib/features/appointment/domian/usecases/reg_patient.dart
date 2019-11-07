import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/repositories/patients_repository.dart';

class RegPatient {
  final PatientsRepository repository;
  RegPatient({@required this.repository});
  Future<Either<Failures, bool>> call(Patient patient) async {
    return await repository.regPatient(patient);
  }
}
