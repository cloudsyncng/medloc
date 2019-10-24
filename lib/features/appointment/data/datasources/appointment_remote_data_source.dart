import 'package:med_plus/features/appointment/data/models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments(int patientId);
}
