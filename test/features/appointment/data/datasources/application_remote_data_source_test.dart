import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  ApplicationRemoteDataSourceImpl remote;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remote = ApplicationRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("Get hospitals", () {
    test('should perform a GET request to hospitals endpoint', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('hospitals.json'), 200));
      //act
      await remote.getHospitals();
      //assert
      verify(mockHttpClient.get('http://10.0.2.2:8000/api/hospitals',
          headers: {'Content-Type': 'application/json'}));
    });
  });

  group("Get Appointments", () {
    final tPatientId = 1;
    final tAppointmentModels =
        AppointmentModel.appointmentsJsonParser(fixture('appointments.json'));
    test(
        "should perform a GET request on a URL with patient_id being the end point",
        () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('appointments.json'), 200));
      //act
      await remote.getAppointments(tPatientId);
      //assert
      verify(mockHttpClient.get(
          'http://10.0.2.2:8000/api/appointments/$tPatientId',
          headers: {'Content-Type': 'application/json'}));
    });

    test("description", () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('appointments.json'), 200));
      //act
      final result = await remote.getAppointments(tPatientId);
      //assert
      expect(result, equals(tAppointmentModels));
    });
  });
}
