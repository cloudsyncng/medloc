import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  final tHospital = HospitalModel(
      hospitalId: 1,
      name: "Ola",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [13.5552, 12.5565]);
  test("should be a type of hospital", () {
    //assert
    expect(tHospital, isA<Hospital>());
  });

  group("fromJson", () {
    test("should return a valid hospital model when fromJson method is called",
        () {
      //arrange
      final jsonMap = List<Map<String, dynamic>>.from(
          jsonDecode(fixture("hospitals.json")));

      //act
      final result = HospitalModel.fromJson(jsonMap.first);
      //assert
      expect(result, tHospital);
    });
  });

  group("toJson", () {
    test("should return a valid json when tojson is called", () {
      //act
      final result = tHospital.toJson();
      //assert
      expect(result, {
        "hospitalId": 1,
        "name": "Ola",
        "country": "Nigeria",
        "state": "Plateau",
        "lga": "Jos North",
        "geoPoint": [13.5552, 12.5565]
      });
    });
  });
}
