import 'package:equatable/equatable.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/entities/specialist.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MedlogState extends Equatable {
  const MedlogState([List props = const <dynamic>[]]);
}

class Empty extends MedlogState {}

class Loading extends MedlogState {}

class Loaded extends MedlogState {
  final Hospital hospital;
  final Specialist specialist;
  final List<Appointment> appointments;
  final Patient patient;

  Loaded({this.hospital, this.specialist, this.appointments, this.patient})
      : super([hospital, specialist, appointments, patient]);
}

class Error extends MedlogState {
  final String message;
  Error({this.message}) : super([message]);
}
