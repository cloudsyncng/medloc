import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Specialist extends Equatable {
  final int id;
  final String title;
  final String firstName;
  final String surname;
  final String specialty;

  Specialist(
      {this.id,
      @required this.title,
      @required this.firstName,
      @required this.surname,
      @required this.specialty})
      : super([id, title, firstName, surname, specialty]);
}
