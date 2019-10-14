import 'dart:convert';

import 'package:matcher/matcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/features/appointment/data/datasources/hospital_local_data_source.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  HospitalLocalDataSourceImpl hospitalLocalDataSourceImpl;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    hospitalLocalDataSourceImpl =
        HospitalLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("getHospitals", () {
    final tHospitals = [];
    final jsonString = List<Map<String, dynamic>>.from(
        jsonDecode(fixture("cached_hospitals.json")));
    jsonString.forEach((hp) {
      tHospitals.add(HospitalModel.fromJson(hp));
    });

    test("should return hospital from sharedPrferences if there is cached data",
        () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture("cached_hospitals.json"));
      //act
      final result = await hospitalLocalDataSourceImpl.getHospitals();
      //assert
      verify(mockSharedPreferences.getString(CACHED_HOSPITALS));
      expect(result, tHospitals);
    });

    test("should return CacheException when there is no cached value",
        () async {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      //act
      final call = hospitalLocalDataSourceImpl.getHospitals;
      //assert

      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group("CacheHospitals", () {});
}
