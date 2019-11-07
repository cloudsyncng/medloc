import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:med_plus/features/appointment/data/datasources/application_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointments_repository.dart';

class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final NetworkInfo networkInfo;
  final ApplicationRemoteDataSource applicationRemoteDataSource;
  final ApplicationLocalDataSource applicationLocalDataSource;

  AppointmentsRepositoryImpl(
      {this.networkInfo,
      this.applicationRemoteDataSource,
      this.applicationLocalDataSource});
  @override
  Future<Either<Failures, List<Appointment>>> getAppointments() async {
    if (!await networkInfo.isConnected) {
      try {
        final appointmnets =
            await applicationRemoteDataSource.getAppointments();
        //! await applicationLocalDataSource.cacheAppointments(appointmnets);
        return Right(appointmnets);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //final appointments = await applicationLocalDataSource.getAppointments();
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, bool>> addAppointment(Appointment appointment) {
    return null;
  }
}
