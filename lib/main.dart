import 'package:flutter/material.dart';
import 'package:med_plus/features/appointment/presentation/pages/appointment_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/hospitals_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/profile_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/search_hospitals.dart';
import 'package:med_plus/features/appointment/presentation/pages/settings_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/specialists_page.dart';
import 'features/appointment/presentation/pages/dashboard.dart';

void main() {
  runApp(MedPlus());
}

class MedPlus extends StatelessWidget {
  const MedPlus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = {
      'search': (context) => SearchHospitals(),
      'appointments': (context) => AppointmentsPage(),
      'hospitals': (context) => HospitalsPage(),
      'specialists': (context) => SpecialistPage(),
      'profile': (context) => ProfilePage(),
      'settings': (context) => SettingsPage()
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      //debugShowMaterialGrid: true,
      routes: routes,
      home: DashBoard(),
    );
  }
}
