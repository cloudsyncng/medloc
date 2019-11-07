import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:med_plus/features/appointment/data/datasources/application_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/repositories/patients_repository.dart';

class PatientsRepositoryImpl implements PatientsRepository {
  final ApplicationRemoteDataSource remote;
  final ApplicationLocalDataSource local;
  final NetworkInfo networkInfo;

  PatientsRepositoryImpl(
      {@required this.remote,
      @required this.local,
      @required this.networkInfo});

  @override
  Future<Either<Failures, Patient>> getPatient(
      String phone, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePatient = await remote.getPatient(phone, password);
        local.cachePatient(remotePatient);
        return Right(remotePatient);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPatient = await local.getLastCachedPatient(phone, password);
        return Right(localPatient);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failures, bool>> regPatient(Patient patient) async {
    if (await networkInfo.isConnected) {
      try {
        final registered = await remote.regPatient(patient);
        return Right(registered);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
