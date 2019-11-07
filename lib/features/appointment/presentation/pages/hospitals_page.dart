import 'package:flutter/material.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';

class HospitalsPage extends StatefulWidget {
  HospitalsPage({Key key}) : super(key: key);

  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5),
                itemCount: fakeHospital.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<HospitalModel> fakeHospital = [
  HospitalModel(
      hospitalId: 1,
      name: "Jos University Teaching Hospital",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [14.225562, 13.665588]),
  HospitalModel(
      hospitalId: 2,
      name: "Jos Specialist Hospital",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [14.225562, 13.665588]),
  HospitalModel(
      hospitalId: 3,
      name: "Ola Hospital",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [14.225562, 13.665588]),
  HospitalModel(
      hospitalId: 4,
      name: "Kauna Hospital",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [14.225562, 13.665588]),
  HospitalModel(
      hospitalId: 5,
      name: "Sauki Hospital",
      country: "Nigeria",
      state: "Plateau",
      lga: "Jos North",
      geoPoint: [14.225562, 13.665588]),
];
