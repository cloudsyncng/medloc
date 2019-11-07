import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:meta/meta.dart';

class PatientModel extends Patient {
  PatientModel(
      {int id,
      @required String firstName,
      @required String surname,
      @required DateTime dob,
      @required String gender,
      @required String password,
      @required String phone})
      : super(
            id: id,
            firstName: firstName,
            surname: surname,
            dob: dob,
            gender: gender,
            password: password,
            phone: phone);

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
        id: json["id"],
        firstName: json["first_name"],
        surname: json["surname"],
        dob: json["dob"],
        gender: json["gender"],
        password: json["password"],
        phone: json["phone"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "firstName": this.firstName,
      "surname": this.surname,
      "dob": this.dob,
      "gender": this.gender,
      "password": this.password,
      "phone": this.phone
    };
  }
}
