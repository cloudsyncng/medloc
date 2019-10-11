import 'package:dartz/dartz.dart';
import 'package:med_plus/core/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';

abstract class HospitalRepository {
  Future<Either<Failures, List<Hospital>>> getHospitals();
  Future<Either<Failures, Hospital>> getHospital(int id);
}
