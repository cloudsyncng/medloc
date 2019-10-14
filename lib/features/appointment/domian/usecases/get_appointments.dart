import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointment_repository.dart';

class GetAppointments {
  final AppointmentRepository repository;

  GetAppointments(this.repository);
  Future<Either<Failures, List<Appointment>>> call() async {
    return await repository.getAppointments();
  }
}
