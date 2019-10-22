import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DbBtnModel {
  final IconData icon;
  final String title;
  final String url;
  DbBtnModel({this.icon, this.title, this.url});
}

List<DbBtnModel> dbBtns = [
  DbBtnModel(icon: MdiIcons.shieldSearch, title: "Search", url: "search"),
  DbBtnModel(
      icon: MdiIcons.viewDashboard, title: "Appointments", url: "appointments"),
  DbBtnModel(
      icon: MdiIcons.hospitalMarker, title: "Hospitals", url: "hospitals"),
  DbBtnModel(
      icon: MdiIcons.scatterPlotOutline,
      title: "Specialists",
      url: "specialists"),
  DbBtnModel(icon: MdiIcons.account, title: "Profile", url: "profile"),
  DbBtnModel(icon: MdiIcons.settings, title: "Settings", url: "settings"),
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 6)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            dbBtnModel.icon,
            size: 50,
            color: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dbBtnModel.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }
}
