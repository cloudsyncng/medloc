import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Patient extends Equatable {
  final int patientId;
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String gender;
  final String phone;

  Patient(
      {this.patientId,
      @required this.firstName,
      @required this.lastName,
      @required this.dob,
      @required this.gender,
      @required this.phone})
      : super([patientId, firstName, lastName, dob, gender, phone]);
}
