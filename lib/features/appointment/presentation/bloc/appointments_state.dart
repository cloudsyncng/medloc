import 'package:equatable/equatable.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppointmentsState extends Equatable {
  AppointmentsState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends AppointmentsState {}

class Loading extends AppointmentsState {}

class Loaded extends AppointmentsState {
  final Appointment appointment;

  Loaded({@required this.appointment}) : super([appointment]);
}

class Error extends AppointmentsState {
  final String message;

  Error({@required this.message}) : super([message]);
}
