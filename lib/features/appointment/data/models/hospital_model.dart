import 'package:med_plus/features/appointment/domian/entities/hospital.dart';

class HospitalModel extends Hospital {
  HospitalModel({
    int hospitalId,
    String name,
    String state,
    String country,
    String lga,
    List<dynamic> geoPoint,
  }) : super(
            hospitalId: hospitalId,
            name: name,
            state: state,
            country: country,
            lga: lga,
            geoPoint: geoPoint);

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
        hospitalId: json["hospitalId"],
        name: json["name"],
        country: json["country"],
        state: json["state"],
        lga: json["lga"],
        geoPoint: json["geoPoint"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "hospitalId": hospitalId,
      "name": name,
      "country": country,
      "state": state,
      "lga": lga,
      "geoPoint": geoPoint
    };
  }

  List<HospitalModel> hospitaJsonParser(List<Map<String, dynamic>> jsonList) {
    List<HospitalModel> hospitalModels = [];
    jsonList.forEach((hospitalJson) {
      hospitalModels.add(HospitalModel.fromJson(hospitalJson));
    });

    return hospitalModels;
  }
}
