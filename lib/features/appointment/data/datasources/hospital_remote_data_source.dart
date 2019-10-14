import 'package:med_plus/features/appointment/data/models/hospital_model.dart';

abstract class HospitalRemoteDataSource {
  Future<List<HospitalModel>> getHospitals();
}
