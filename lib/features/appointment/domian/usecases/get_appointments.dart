import 'package:dartz/dartz.dart';
import 'package:med_plus/core/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointment_repository.dart';

class GetAppointments {
  final AppointmentRepository repository;

  GetAppointments(this.repository);
  Future<Either<Failures, List<Appointment>>> execute() {
    return repository.getAppointments();
  }
}
