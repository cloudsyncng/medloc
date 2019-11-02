import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointments_repository.dart';

class AddAppoiments {
  final AppointmentsRepository repository;

  AddAppoiments({@required this.repository});

  Future<Either<Failures, bool>> addAppointment(Appointment appointment) {
    return null;
  }
}
