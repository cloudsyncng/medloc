import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  final tAppointmentModel = AppointmentModel(
      appointmentId: 1,
      patientId: 1,
      hospitalId: 1,
      date: DateTime(2017, 05, 25));

  test("should be a subclass  of appointment entity", () {
    expect(tAppointmentModel, isA<Appointment>());
  });

  group("fromJson", () {
    test("should return a valid appointment model", () {
      //arrange
      final jsonString = List<Map<String, dynamic>>.from(
          jsonDecode(fixture("appointments.json")));
      //act
      final result = AppointmentModel.fromJson(jsonString.first);
      //assert
      expect(result, tAppointmentModel);
    });
  });

  group("toJson", () {
    test("should return json from appointment model", () {
      //acct
      final result = tAppointmentModel.toJson();
      //assert
      expect(result, {
        "appointmentId": 1,
        "patientId": 1,
        "hospitalId": 1,
        "date": DateTime(2017, 05, 25)
      });
    });
  });
}
