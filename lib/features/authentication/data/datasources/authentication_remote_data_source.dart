import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:med_plus/core/errors/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:med_plus/features/appointment/data/models/patient_model.dart';
import 'package:med_plus/features/authentication/data/models/Login_credential_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<PatientModel> login(LoginCredentialModel loginCredential);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final http.Client client;

  AuthenticationRemoteDataSourceImpl({@required this.client});

  @override
  Future<PatientModel> login(LoginCredentialModel loginCredential) async {
    final http.Response response = await client.post(
        'http://10.0.2.2:8000/api/hospitals',
        headers: {'Content-Type': 'application/json'},
        body: loginCredential.toJson());
    if (response.statusCode == 200) {
      return PatientModel.fromJson(jsonDecode(response.body));
    }else{
      throw ServerException();
    }
  }
}
