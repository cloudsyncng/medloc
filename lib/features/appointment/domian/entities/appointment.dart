import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Appointment extends Equatable {
  final int id;
  final int patient_id;
  final int hospital_id;
  final int specialist_id;
  final String date;
  final bool status;
  final bool isDone;

  Appointment({
    this.id,
    @required this.patient_id,
    @required this.hospital_id,
    @required this.specialist_id,
    @required this.date,
    @required this.status,
    @required this.isDone,
  }) : super([
          id,
          patient_id,
          hospital_id,
          specialist_id,
          date,
          status,
          isDone,
        ]);
}
