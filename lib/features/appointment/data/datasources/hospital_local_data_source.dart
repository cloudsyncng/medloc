import 'dart:convert';

import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class HospitalLocalDataSource {
  Future<List<HospitalModel>> getHospitals();
  Future<void> cacheHospitals(List<HospitalModel> hospitalModels);
}

const CACHED_HOSPITALS = "CACHED_HOSPITALS";

class HospitalLocalDataSourceImpl implements HospitalLocalDataSource {
  final SharedPreferences sharedPreferences;

  HospitalLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheHospitals(List<HospitalModel> hospitalModels) {
    // TODO: implement cacheHospitals
    return null;
  }

  @override
  Future<List<HospitalModel>> getHospitals() {
    final jsonString = sharedPreferences.getString(CACHED_HOSPITALS);
    if (jsonString != null) {
      final List<HospitalModel> hospitals = [];
      final maps = List<Map<String, dynamic>>.from(jsonDecode(jsonString));
      maps.forEach((hp) {
        hospitals.add(HospitalModel.fromJson(hp));
      });
      return Future.value(hospitals);
    } else {
      throw CacheException();
    }
  }
}
