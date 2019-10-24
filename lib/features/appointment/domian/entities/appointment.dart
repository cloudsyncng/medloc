import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Appointment extends Equatable {
  final int appointmentId;
  final int patientId;
  final int hospitalId;
  final int specialistId;
  final DateTime date;
  final String status;
  final bool isDone;

  Appointment(
      {this.appointmentId,
      @required this.patientId,
      @required this.hospitalId,
      @required this.specialistId,
      @required this.date,
      @required this.status,
      @required this.isDone})
      : super([
          appointmentId,
          patientId,
          hospitalId,
          specialistId,
          date,
          status,
          isDone
        ]);
}
