import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Patient extends Equatable {
  final int id;
  final String firstName;
  final String surname;
  final DateTime dob;
  final String gender;
  final String password;
  final String phone;

  Patient(
      {this.id,
      @required this.firstName,
      @required this.surname,
      @required this.dob,
      @required this.gender,
      @required this.phone,
      @required this.password})
      : super([id, firstName, surname, dob, gender, phone, password]);
}
