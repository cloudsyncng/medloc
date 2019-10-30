import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:med_plus/features/appointment/data/datasources/application_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  ApplicationRemoteDataSourceImpl remote;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remote = ApplicationRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("Get hospitals", () {
    test('should perform a GET request to hospitals endpoint', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('hospitals.json'), 200));
      //act
      await remote.getHospitals();
      //assert
      verify(mockHttpClient.get('http://medlog/api/hospitals',
          headers: {'Content-Type': 'application/json'}));
    });
  });
}
