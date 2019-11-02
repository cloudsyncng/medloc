import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointments_repository.dart';
import 'package:med_plus/features/appointment/domian/usecases/add_appointment.dart';
import 'package:mockito/mockito.dart';

class MockAppointmentsRepository extends Mock
    implements AppointmentsRepository {}

void main() {
  AddAppoiments usecase;
  MockAppointmentsRepository repository;

  setUp(() {
    repository = MockAppointmentsRepository();
    usecase = AddAppoiments(repository: repository);
  });
  group("Add Appointment", () {
    test("Should say something here", () async {});
  });
}
