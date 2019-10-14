import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:med_plus/features/appointment/domian/entities/patient.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_patients.dart';
import 'package:med_plus/features/appointment/domian/repositories/patient_repository.dart';

class MockPatientRepository extends Mock implements PatientRepository {}

void main() {
  GetPatient usecase;
  MockPatientRepository mockPatientRepository;

  setUp(() {
    mockPatientRepository = MockPatientRepository();
    usecase = GetPatient(mockPatientRepository);
  });
  final tId = 1;
  final tPatient = Patient(
    patientId: 1,
    firstName: "ismailawa",
    lastName: "Aliyu",
    gender: "male",
    dob: DateTime(1985, 07, 15),
    phone: "08133996655",
  );

  test('should get patient from the repository', () async {
    //arrange
    when(mockPatientRepository.getPatient(any))
        .thenAnswer((_) async => Right(tPatient));
    //act
    final result = await usecase(id: tId);
    //assert
    expect(result, Right(tPatient));
    verify(mockPatientRepository.getPatient(tId));
    verifyNoMoreInteractions(mockPatientRepository);
  });
}
