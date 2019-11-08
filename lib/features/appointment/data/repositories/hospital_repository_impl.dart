import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';

import 'package:med_plus/features/appointment/data/datasources/application_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:med_plus/features/appointment/domian/repositories/hospital_repository.dart';

typedef Future<List<Hospital>> _singleOrManyHospitals();

class HospitalRepositoryImpl implements HospitalRepository {
  final ApplicationRemoteDataSource remoteDataSource;
  final ApplicationLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HospitalRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failures, List<Hospital>>> getHospitals() async {
    return await _getHospitals(() {
      return remoteDataSource.getHospitals();
    });
  }

  Future<Either<Failures, List<Hospital>>> _getHospitals(
      _singleOrManyHospitals getGeneralHospitals) async {
    if (/*await networkInfo.isConnected*/ true) {
      try {
        final remoteHospital = await getGeneralHospitals();
        // localDataSource.cacheHospitals(remoteHospital);
        return Right(remoteHospital);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final localSource = await localDataSource.getHospitals();
      //   return Right(localSource);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      return Left(ServerFailure());
    }
  }
}
