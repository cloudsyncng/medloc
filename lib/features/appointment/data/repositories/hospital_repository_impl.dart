import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';

import 'package:med_plus/features/appointment/data/datasources/hospital_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/hospital_remote_data_source.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:med_plus/features/appointment/domian/repositories/hospital_repository.dart';

typedef Future<List<Hospital>> _singleOrManyHospitals();

class HospitalRepositoryImpl implements HospitalRepository {
  final HospitalRemoteDataSource remoteDataSource;
  final HospitalLocalDataSource localDatasource;
  final NetworkInfo networkInfo;

  HospitalRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDatasource,
      @required this.networkInfo});

  @override
  Future<Either<Failures, List<Hospital>>> getHospitals() async {
    return await _getHospitals(() {
      return remoteDataSource.getHospitals();
    });
  }

  Future<Either<Failures, List<Hospital>>> _getHospitals(
      _singleOrManyHospitals getGeneralHospitals) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHospital = await getGeneralHospitals();
        localDatasource.cacheHospitals(remoteHospital);
        return Right(remoteHospital);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDataSource = await localDatasource.getHospitals();
        return Right(localDataSource);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
