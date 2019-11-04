import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DbBtnModel {
  final IconData icon;
  final String title;
  final String url;
  final String imageUrl;
  final Color color;
  DbBtnModel({
    this.icon,
    this.title,
    this.url,
    this.color,
    this.imageUrl,
  });
}

List<DbBtnModel> dbBtns = [
  DbBtnModel(
      icon: MdiIcons.navigation,
      title: "Search",
      url: "search",
      color: Colors.blueAccent,
      imageUrl: "assets/images/search.png"),
  DbBtnModel(
      icon: MdiIcons.viewDashboard,
      title: "Appointments",
      url: "appointments",
      color: Colors.greenAccent.shade700,
      imageUrl: "assets/images/appoints.png"),
  DbBtnModel(
      icon: MdiIcons.hospitalMarker,
      title: "Hospitals",
      url: "hospitals",
      color: Colors.redAccent,
      imageUrl: "assets/images/hospital.png"),
  DbBtnModel(
      icon: MdiIcons.scatterPlotOutline,
      title: "Specialists",
      url: "specialists",
      color: Colors.yellowAccent.shade700,
      imageUrl: "assets/images/appointment.png"),
  DbBtnModel(
      icon: MdiIcons.account,
      title: "Profile",
      url: "profile",
      color: Colors.cyan.shade700,
      imageUrl: "assets/images/profile.png"),
  DbBtnModel(
      icon: MdiIcons.settings,
      title: "Settings",
      url: "settings",
      color: Colors.lightBlueAccent,
      imageUrl: "assets/images/settings.png"),
];

///This widget takes the[DbBtnModel] to generate
///buttons in the dashboard page.
class DbBtn extends StatelessWidget {
  final DbBtnModel dbBtnModel;
  const DbBtn({Key key, this.dbBtnModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dbBtnModel.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              dbBtnModel.title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    dbBtnModel.imageUrl,
                    colorBlendMode: BlendMode.clear,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
