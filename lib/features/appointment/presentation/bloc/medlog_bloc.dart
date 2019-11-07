import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_appointments.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_patient.dart';
import './bloc.dart';

class MedlogBloc extends Bloc<MedlogEvent, MedlogState> {
  final GetPatient getPatient;
  final GetAppointments getAppointments;

  MedlogBloc({GetPatient mgetPatient, GetAppointments getAp})
      : assert(mgetPatient != null),
        assert(getAp != null),
        getPatient = mgetPatient,
        getAppointments = getAp;

  @override
  MedlogState get initialState => Empty();

  @override
  Stream<MedlogState> mapEventToState(
    MedlogEvent event,
  ) async* {
    if (event is GetPatientEvent) {
      yield Loading();
      final patient = await getPatient(event.phone, event.password);
      yield patient.fold(
          (failures) => Error(message: _mapFailureToMessage(failures)),
          (patient) => Loaded(patient: patient));
    } else if (event is GetAppointmentsEvents) {
      yield Loading();
      final appointments = await getAppointments();
      yield appointments.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (appointments) => Loaded(appointments: appointments));
    }
  }

  String _mapFailureToMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return "server failure";
      case CacheFailure:
        return "cache failure";
      case NetworkFailure:
        return "network failure";
      default:
        return "Unexpected failure";
    }
  }
}
