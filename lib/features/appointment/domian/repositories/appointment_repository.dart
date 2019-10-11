import 'package:dartz/dartz.dart';
import 'package:med_plus/core/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';

abstract class AppointmentRepository {
  Future<Either<Failures, List<Appointment>>> getAppointments();
}
