import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class HospitalRemoteDataSource {
  Future<List<HospitalModel>> getHospitals();
  Future<List<HospitalModel>> getAppointments();
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  final http.Client client;

  HospitalRemoteDataSourceImpl({@required this.client});
  @override
  Future<List<HospitalModel>> getHospitals() async {
    final http.Response response = await client.get(
        'http://medlog/api/hospitals',
        headers: {'Content-Type': 'application/json'});
    return HospitalModel().hospitaJsonParser(response.body);
  }

  @override
  Future<List<HospitalModel>> getAppointments() {
    // TODO: implement getAppointments
    return null;
  }
}
