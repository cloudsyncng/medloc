import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/repositories/patients_repository.dart';

class GetPatient {
  final PatientsRepository repository;

  GetPatient({@required this.repository});
  Future<Either<Failures, Patient>> call(String phone, String password) async {
    return await repository.getPatient(phone, password);
  }
}
