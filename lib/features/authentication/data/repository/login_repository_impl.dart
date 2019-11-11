import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/features/authentication/data/models/Login_credential_model.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:med_plus/features/authentication/domain/entity/login_credential.dart';
import 'package:med_plus/features/authentication/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final AuthenticationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failures, Patient>> login(LoginCredential loginCredential) async {
    if (await networkInfo.isConnected) {
      try{
        final patient = await remoteDataSource.login(loginCredential);
        return Right(patient);
      } on ServerException{
        return left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }

  }

}