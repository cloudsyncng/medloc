import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failures, Type>> call(Params params);
}
