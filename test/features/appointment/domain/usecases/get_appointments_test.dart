import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/features/appointment/domian/entities/appointment.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_appointments.dart';
import 'package:med_plus/features/appointment/domian/repositories/appointment_repository.dart';

class MockAppointmentsRepository extends Mock implements AppointmentRepository {
}

void main() {
  GetAppointments usecase;
  MockAppointmentsRepository mockAppointmentsRepository;

  setUp(() {
    mockAppointmentsRepository = MockAppointmentsRepository();
    usecase = GetAppointments(mockAppointmentsRepository);
  });

  final tAppointment = [
    Appointment(
        appointmentId: 1,
        hospitalId: 1,
        patientId: 1,
        date: DateTime(2018, 05, 12)),
    Appointment(
        appointmentId: 1,
        hospitalId: 1,
        patientId: 1,
        date: DateTime(2018, 05, 12))
  ];

  test("should returns list of hospitals when get appointments is called",
      () async {
    //arrange
    when(mockAppointmentsRepository.getAppointments())
        .thenAnswer((_) async => Right(tAppointment));
    //act
    final result = await usecase();
    //assert
    expect(result, Right(tAppointment));
    verify(mockAppointmentsRepository.getAppointments());
    verifyNoMoreInteractions(mockAppointmentsRepository);
  });
}
