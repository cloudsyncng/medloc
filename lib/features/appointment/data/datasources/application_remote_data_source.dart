import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class ApplicationRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments(int patientId);
  Future<bool> addAppointments(AppointmentModel appointmentModel);
  Future<List<HospitalModel>> getHospitals();
}

class ApplicationRemoteDataSourceImpl implements ApplicationRemoteDataSource {
  final http.Client client;

  ApplicationRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<AppointmentModel>> getAppointments(int patientId) async {
    final http.Response response = await client.get(
        'http://10.0.2.2:8000/api/appointments/$patientId',
        headers: {'Content-Type': 'application/json'});
    return AppointmentModel.appointmentsJsonParser(response.body);
  }

  @override
  Future<List<HospitalModel>> getHospitals() {
    client.get('http://10.0.2.2:8000/api/hospitals',
        headers: {'Content-Type': 'application/json'});
    return null;
  }

  @override
  Future<bool> addAppointments(AppointmentModel appointmentModel) {
    // TODO: implement addAppointments
    return null;
  }
}
