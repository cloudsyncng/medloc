import 'package:med_plus/features/authentication/domain/entity/login_credential.dart';

class LoginCredentialModel extends LoginCredential {
  LoginCredentialModel({String phone, String password})
      : super(phone: phone, password: password);

  factory LoginCredentialModel.fromJson(Map<String, dynamic> json){
    return LoginCredentialModel(
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'phone': phone,
      'password': password
    };
  }
}
