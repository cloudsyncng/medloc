import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';

abstract class AppointmentsRepository {
  Future<Either<Failures, List<Appointment>>> getAppointments(int patientId);
  Future<Either<Failures, bool>> addAppointment(Appointment appointment);
}
