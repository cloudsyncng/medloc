import 'package:dartz/dartz.dart';
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
  Future<Either<Failures, List<Appointment>>> getAppointments(int patientId) {
    // TODO: implement getAppointments
    return null;
  }

  @override
  Future<Either<Failures, bool>> addAppointment(Appointment appointment) {
    // TODO: implement addAppointment
    return null;
  }
}
