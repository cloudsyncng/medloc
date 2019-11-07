import 'package:flutter/material.dart';
import 'package:med_plus/features/appointment/data/models/specialist_model.dart';

class SpecialistPage extends StatefulWidget {
  SpecialistPage({Key key}) : super(key: key);

  @override
  _SpecialistPageState createState() => _SpecialistPageState();
}

class _SpecialistPageState extends State<SpecialistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: specialist.length,
          itemBuilder: (context, index) {
            return Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card());
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.green,
              height: 10,
            );
          },
        ),
      ),
    );
  }
}

List<SpecialistModel> specialist = [
  SpecialistModel(
      id: 1,
      title: "Dr",
      firstName: "Ismailawa",
      surname: "Aliyu",
      specialty: "GGGGGGGGG"),
  SpecialistModel(
      id: 2,
      title: "Dr",
      firstName: "Sam",
      surname: "David",
      specialty: "GGGGGGGGG"),
  SpecialistModel(
      id: 3,
      title: "Dr",
      firstName: "Emmanuel",
      surname: "Samuel",
      specialty: "GGGGGGGGG"),
  SpecialistModel(
      id: 4,
      title: "Dr",
      firstName: "Emmanuel",
      surname: "Samuel",
      specialty: "GGGGGGGGG"),
];
