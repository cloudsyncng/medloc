import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppointmentsEvent extends Equatable {
  AppointmentsEvent([List props = const <dynamic>[]]) : super(props);
}

class GetAppointmentsEvent extends AppointmentsEvent {
  final int patientId;

  GetAppointmentsEvent({@required this.patientId});
}
