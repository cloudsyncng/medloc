import 'dart:convert';

import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';

abstract class ApplicationLocalDataSource {
  Future<List<HospitalModel>> getHospitals();
  Future<List<AppointmentModel>> getAppointments();
  Future<void> cacheHospitals(List<HospitalModel> hospitalModels);
  Future<void> cacheAppointments(List<AppointmentModel> appointmentsModels);
}

const CACHED_HOSPITALS = "CACHED_HOSPITALS";

class ApplicationDataSourceImpl implements ApplicationLocalDataSource {
  final SharedPreferences sharedPreferences;

  ApplicationDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheHospitals(List<HospitalModel> hospitalModels) {
    // TODO: implement cacheHospitals
    return null;
  }

  @override
  Future<List<HospitalModel>> getHospitals() {
    final jsonString = sharedPreferences.getString(CACHED_HOSPITALS);
    if (jsonString != null) {
      return Future.value(
          HospitalModel.hospitalJsonParser(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<AppointmentModel>> getAppointments() {
    // TODO: implement getAppointments
    return null;
  }

  @override
  Future<void> cacheAppointments(List<AppointmentModel> appointmentsModels) {
    // TODO: implement cacheAppointments
    return null;
  }
}
