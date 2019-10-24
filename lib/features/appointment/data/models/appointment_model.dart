import 'dart:ffi';

import 'package:med_plus/features/appointment/domian/entities/appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel(
      {int appointmentId,
      int patientId,
      int hospitalId,
      int specialistId,
      DateTime date,
      String status,
      bool isDone})
      : super(
            appointmentId: appointmentId,
            patientId: patientId,
            hospitalId: hospitalId,
            specialistId: specialistId,
            date: date,
            status: status,
            isDone: isDone);

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        appointmentId: json['appointmentId'],
        patientId: json['patientId'],
        hospitalId: json['hospitalId'],
        specialistId: json['specialistId'],
        date: json['date'],
        status: json['status'],
        isDone: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'patientId': patientId,
      'hospitalId': hospitalId,
      'specialistId': specialistId,
      'date': date,
      'status': status,
      'isDone': isDone
    };
  }
}
