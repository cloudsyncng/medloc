import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MedlogEvent extends Equatable {
  const MedlogEvent([List props = const <dynamic>[]]);
}

class GetAppointmentsEvents extends MedlogEvent {}

class GetSpecialistsEvent extends MedlogEvent {}

class GetHospitalsEvent extends MedlogEvent {}

class GetHospitalsWithSpecialityEvent extends MedlogEvent {
  final String query;

  GetHospitalsWithSpecialityEvent({@required this.query});
}
