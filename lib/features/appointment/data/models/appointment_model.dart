import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:meta/meta.dart';

class AppointmentModel extends Appointment {
  AppointmentModel(
      {int appointmentId,
      @required int patientId,
      @required int hospitalId,
      @required DateTime date})
      : super(
            appointmentId: appointmentId,
            hospitalId: hospitalId,
            patientId: patientId,
            date: date);

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        hospitalId: json['hospitalId'],
        patientId: json['patientId'],
        appointmentId: json['appointmentId'],
        date: DateTime.parse(json['date']));
  }

  Map<String, dynamic> toJson() {
    return {
      "appointmentId": appointmentId,
      "hospitalId": hospitalId,
      "patientId": patientId,
      "date": date
    };
  }
}
