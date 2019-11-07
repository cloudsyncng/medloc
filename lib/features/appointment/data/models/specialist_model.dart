import 'package:med_plus/features/appointment/domian/entities/specialist.dart';

class SpecialistModel extends Specialist {
  SpecialistModel(
      {int id,
      String title,
      String firstName,
      String surname,
      String specialty})
      : super(
            id: id,
            title: title,
            firstName: firstName,
            surname: surname,
            specialty: specialty);
}
