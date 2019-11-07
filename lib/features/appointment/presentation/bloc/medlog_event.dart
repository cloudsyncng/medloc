import 'package:equatable/equatable.dart';
import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MedlogEvent extends Equatable {
  const MedlogEvent([List props = const <dynamic>[]]);
}

class GetAppointmentsEvents extends MedlogEvent {}

class GetSpecialistsEvent extends MedlogEvent {}

class GetHospitalsEvent extends MedlogEvent {}

class GetPatientEvent extends MedlogEvent {
  final String phone;
  final String password;

  GetPatientEvent({this.phone, this.password}) : super([phone, password]);
}

class RegPatientEvent extends MedlogEvent {
  final Patient patient;

  RegPatientEvent({this.patient}) : super([patient]);
}
