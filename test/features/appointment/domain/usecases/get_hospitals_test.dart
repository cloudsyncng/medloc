import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:med_plus/features/appointment/domian/usecases/get_hospitals.dart';
import 'package:med_plus/features/appointment/domian/repositories/hospital_repository.dart';

class MockHospitalRepository extends Mock implements HospitalRepository {}

void main() {
  GetHospitals usecase;
  MockHospitalRepository mockHospitalRepository;

  setUp(() {
    mockHospitalRepository = MockHospitalRepository();
    usecase = GetHospitals(mockHospitalRepository);
  });

  final List<Hospital> tHospital = [
    Hospital(
        hospitalId: 1,
        name: "Ola",
        lga: "jos north",
        state: "plateau",
        country: "Nigeria",
        geoPoint: [13.111125, 14.55556]),
    Hospital(
        hospitalId: 1,
        name: "Juth",
        lga: "jos north",
        state: "plateau",
        country: "Nigeria",
        geoPoint: [13.12225, 14.55556])
  ];

  test("should return hospital when the get hospitals is called", () async {
    //arrange
    when(mockHospitalRepository.getHospitals())
        .thenAnswer((_) async => Right(tHospital));
    //act
    final result = await usecase();
    //assert
    expect(result, Right(tHospital));
    verify(mockHospitalRepository.getHospitals());
    verifyNoMoreInteractions(mockHospitalRepository);
  });
}
