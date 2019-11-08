import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:med_plus/features/appointment/data/models/patient_model.dart';

abstract class ApplicationRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments();
  Future<bool> addAppointments(AppointmentModel appointmentModel);
  Future<List<HospitalModel>> getHospitals();
  Future<PatientModel> getPatient(String phone, String password);
  Future<bool> regPatient(PatientModel patientModel);
}

class ApplicationRemoteDataSourceImpl implements ApplicationRemoteDataSource {
  final http.Client client;

  ApplicationRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    final http.Response response = await client.get(
        'http://10.0.2.2:8000/api/appointments',
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return AppointmentModel.appointmentsJsonParser(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<HospitalModel>> getHospitals() async {
    final http.Response response = await client.get(
        'http://10.0.2.2:8000/api/hospitals',
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return HospitalModel.hospitalJsonParser(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addAppointments(AppointmentModel appointmentModel) {
    return null;
  }

  @override
  Future<PatientModel> getPatient(String phone, String password) async {
    http.Response response = await client.post(
        'http://10.0.2.2:8000/api/hospitals',
        headers: {'Content-Type': 'application/json'},
        body: {"phone": phone, "password": password});
    if (response.statusCode == 200) {
      return PatientModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> regPatient(PatientModel patientModel) async {
    http.Response response = await client.post(
        'http://10.0.2.2:8000/api/patients',
        headers: {'Content-Type': 'application/json'},
        body: patientModel.toJson());
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      throw ServerException();
    }
  }
}
