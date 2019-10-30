import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';

abstract class ApplicationLocalDataSource {
  Future<List<HospitalModel>> getHospitals();
  Future<void> cacheHospitals(List<HospitalModel> hospitalModels);
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
}
