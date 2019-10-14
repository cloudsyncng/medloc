import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:med_plus/core/errors/failures.dart';
import 'package:med_plus/core/network/network_info.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:med_plus/features/appointment/data/repositories/hospital_repository_impl.dart';
import 'package:med_plus/features/appointment/domian/entities/hospital.dart';
import 'package:mockito/mockito.dart';

import 'package:med_plus/features/appointment/data/datasources/hospital_local_data_source.dart';
import 'package:med_plus/features/appointment/data/datasources/hospital_remote_data_source.dart';

class MockHospitalRemoteDataSource extends Mock
    implements HospitalRemoteDataSource {}

class MockHospitalLocalDataSource extends Mock
    implements HospitalLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockHospitalRemoteDataSource mockHospitalRemoteDataSource;
  MockHospitalLocalDataSource mockHospitalLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  HospitalRepositoryImpl repository;

  setUp(() {
    mockHospitalRemoteDataSource = MockHospitalRemoteDataSource();
    mockHospitalLocalDataSource = MockHospitalLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = HospitalRepositoryImpl(
        remoteDataSource: mockHospitalRemoteDataSource,
        localDatasource: mockHospitalLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  final tHospitalModel = HospitalModel(
      hospitalId: 1,
      name: "Ola",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [13.5552, 12.5565]);
  final List<HospitalModel> tHospitalModels = [
    HospitalModel(
        hospitalId: 1,
        name: "Ola",
        country: "Nigeria",
        state: "Plateau",
        lga: "Jos North",
        geoPoint: [13.5552, 12.5565])
  ];
  final List<Hospital> tHospitals = tHospitalModels;
  final Hospital tHospital = tHospitalModel;

  group("Get hospitals data", () {
    test("Should check if the device is online", () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      await repository.getHospitals();
      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group("Device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test("should return data when the call to remote source is successfull",
        () async {
      //arrange
      when(mockHospitalRemoteDataSource.getHospitals())
          .thenAnswer((_) async => tHospitalModels);
      //act
      final result = await repository.getHospitals();
      //assert
      verify(mockHospitalRemoteDataSource.getHospitals());
      expect(result, equals(Right(tHospitals)));
    });

    test(
        "should cache data locally when the call to remote source is successfull",
        () async {
      //arrange
      when(mockHospitalRemoteDataSource.getHospitals())
          .thenAnswer((_) async => tHospitalModels);
      //act
      await repository.getHospitals();
      //assert
      verify(mockHospitalRemoteDataSource.getHospitals());
      verify(mockHospitalLocalDataSource.cacheHospitals(tHospitalModels));
    });

    test(
        "should return server failure when the call to remote source is unsuccessfull",
        () async {
      //arrange
      when(mockHospitalRemoteDataSource.getHospitals())
          .thenThrow(ServerException());
      //act
      final result = await repository.getHospitals();
      //assert
      verify(mockHospitalRemoteDataSource.getHospitals());
      verifyZeroInteractions(mockHospitalLocalDataSource);
      expect(result, Left(ServerFailure()));
    });
  });

  group("Device is Offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test(
        "should return last locally cached data when if cached data is avialable",
        () async {
      //arrange
      when(mockHospitalLocalDataSource.getHospitals())
          .thenAnswer((_) async => tHospitalModels);
      //act
      final result = await repository.getHospitals();
      //assert
      verifyZeroInteractions(mockHospitalRemoteDataSource);
      verify(mockHospitalLocalDataSource.getHospitals());
      expect(result, equals(Right(tHospitals)));
    });

    test("should return cache failure  when no cached data is avialable",
        () async {
      //arrange
      when(mockHospitalLocalDataSource.getHospitals())
          .thenThrow(CacheException());
      //act
      final result = await repository.getHospitals();
      //assert
      verifyZeroInteractions(mockHospitalRemoteDataSource);
      verify(mockHospitalLocalDataSource.getHospitals());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
