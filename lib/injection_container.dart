import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:med_plus/features/appointment/data/datasources/application_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:med_plus/features/appointment/data/repositories/appointments_repository_impl.dart';
import 'package:med_plus/features/appointment/data/repositories/patients_repository_impl.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointments_repository.dart';
import 'package:med_plus/features/appointment/domian/repositories/patients_repository.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_appointments.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_hospitals.dart';
import 'package:med_plus/features/appointment/presentation/bloc/medlog_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/appointment/data/repositories/hospital_repository_impl.dart';
import 'features/appointment/domian/repositories/hospital_repository.dart';
import 'features/appointment/domian/usecases/get_patient.dart';

//.sl means service locator.
final sl = GetIt.instance;
Future<void> init() async {
  //! features - Appointments
  //bloc
  sl.registerFactory(
      () => MedlogBloc(mgetPatient: sl(), getAp: sl(), mgetHospitals: sl()));
  //usecases
  sl.registerLazySingleton(() => GetPatient(repository: sl()));
  sl.registerLazySingleton(() => GetAppointments(repository: sl()));
  sl.registerLazySingleton(() => GetHospitals(sl()));
  //repository
  sl.registerLazySingleton<PatientsRepository>(() => PatientsRepositoryImpl(
        remote: sl(),
        local: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<AppointmentsRepository>(
      () => AppointmentsRepositoryImpl(
            applicationRemoteDataSource: sl(),
            applicationLocalDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<HospitalRepository>(() => HospitalRepositoryImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));
  //Data sources
  sl.registerLazySingleton<ApplicationRemoteDataSource>(
      () => ApplicationRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ApplicationLocalDataSource>(
      () => ApplicationDataSourceImpl(sharedPreferences: sl()));

  //! core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //!external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
