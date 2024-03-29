import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:med_plus/features/appointment/domian/repositories/hospital_repository.dart';

class GetHospitals {
  final HospitalRepository repository;

  GetHospitals(this.repository);

  Future<Either<Failures, List<Hospital>>> call() async {
    return await repository.getHospitals();
  }
}
