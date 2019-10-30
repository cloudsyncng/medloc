import 'package:med_plus/features/appointment/data/models/appointment_model.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:http/http.dart' as http;

abstract class ApplicationRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments(int patientId);
  Future<List<HospitalModel>> getHospitals();

}

class ApplicationRemoteDataSourceImpl implements ApplicationRemoteDataSource{
  final http.Client client;

  ApplicationRemoteDataSourceImpl({ this.client });

  @override
  Future<List<AppointmentModel>> getAppointments(int patientId) {
    // TODO: implement getAppointments
    return null;
  }

  @override
  Future<List<HospitalModel>> getHospitals() {
    // TODO: implement getHospitals
    return null;
  }

}
