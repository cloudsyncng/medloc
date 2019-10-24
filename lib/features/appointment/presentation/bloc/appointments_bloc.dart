import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_appointments.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  final GetAppointment getAppointment;

  AppointmentsBloc({@required GetAppointment appointment})
      : assert(appointment != null),
        getAppointment = appointment;

  @override
  AppointmentsState get initialState => Empty();

  @override
  Stream<AppointmentsState> mapEventToState(
    AppointmentsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
