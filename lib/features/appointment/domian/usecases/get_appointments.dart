import 'package:med_plus/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointments_repository.dart';

class GetAppointment {
  final AppointmentsRepository repository;

  GetAppointment({@required this.repository});

  Future<Either<Failures, List<Appointment>>> call(int patientId) {
    return repository.getAppointments(patientId);
  }
}
