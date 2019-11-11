import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_appointments.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_hospitals.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_patient.dart';
import './bloc.dart';

class MedlogBloc extends Bloc<MedlogEvent, MedlogState> {
  final GetPatient getPatient;
  final GetAppointments getAppointments;
  final GetHospitals getHospitals;

  MedlogBloc(
      {GetPatient mgetPatient,
      GetAppointments getAp,
      GetHospitals mgetHospitals})
      : assert(mgetPatient != null),
        assert(getAp != null),
        assert(mgetHospitals != null),
        getPatient = mgetPatient,
        getAppointments = getAp,
        getHospitals = mgetHospitals;

  @override
  MedlogState get initialState => Empty();

  @override
  Stream<MedlogState> mapEventToState(
    MedlogEvent event,
  ) async* {
    if (event is GetAppointmentsEvents) {
      yield Loading();
      final appointments = await getAppointments();
      yield appointments.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (appointments) => Loaded(appointments: appointments));
    } else if (event is GetHospitalsEvent) {
      yield Loading();
      final hospitals = await getHospitals();
      yield hospitals.fold(
          (failures) => Error(message: _mapFailureToMessage(failures)),
          (hospitals) => Loaded(hospitals: hospitals));
    } else if (state is GetHospitalsWithSpecialityEvent) {
      yield Loading();
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
