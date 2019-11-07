import 'dart:convert';

import 'package:med_plus/features/appointment/domian/entities/appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel(
      {int id,
      int patient_id,
      int hospital_id,
      int specialist_id,
      String date,
      bool status,
      bool isDone})
      : super(
            id: id,
            patient_id: patient_id,
            hospital_id: hospital_id,
            specialist_id: specialist_id,
            date: date,
            status: status,
            isDone: isDone);

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        id: json['id'],
        patient_id: json['patient_id'],
        hospital_id: json['hospital_id'],
        specialist_id: json['specialist_id'],
        date: json['date'],
        status: json['status'] == 1 ? true : false,
        isDone: json['isDone'] == 1 ? true : false);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patient_id,
      'hospital_id': hospital_id,
      'specialist_id': specialist_id,
      'date': date,
      'status': status,
      'isDone': isDone
    };
  }

  static List<AppointmentModel> appointmentsJsonParser(String jsonString) {
    final listOfJsonMap = List.from(jsonDecode(jsonString));
    List<AppointmentModel> appointmentModels = [];

    listOfJsonMap.forEach((appointment) {
      appointmentModels.add(AppointmentModel.fromJson(appointment));
    });

    return appointmentModels;
  }
}
