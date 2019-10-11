import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Appointment extends Equatable {
  final int appointmentId;
  final int patientId;
  final int hospitalId;
  final DateTime date;

  Appointment({
    this.appointmentId,
    @required this.patientId,
    @required this.hospitalId,
    @required this.date,
  }) : super([appointmentId, patientId, hospitalId, date]);
}
