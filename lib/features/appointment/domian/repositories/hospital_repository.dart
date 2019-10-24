import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';

abstract class HospitalRepository {
  Future<Either<Failures, List<Hospital>>> getHospitals();
}
