import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/utils/styles.dart';

class AppointmentsPage extends StatefulWidget {
  AppointmentsPage({Key key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Appointments"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(MdiIcons.more),
            )
          ],
        ),
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () async {
                return Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("List is up to date"),
                ));
              },
              child: ListView(
                children: <Widget>[
                  buildExpandedTile(),
                  buildExpandedTile(),
                  buildExpandedTile(),
                  buildExpandedTile(),
                ],
              ),
            );
          },
        ));
  }

  Padding buildExpandedTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        onExpansionChanged: (isOpen) {},
        title: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "JUTH",
                style: tileHeaderStyle,
              ),
              Text(
                "2015-08-25",
                style: tileHeaderStyle,
              ),
              Text(
                "Pending",
                style: tileHeaderStyle,
              ),
            ],
          ),
        ),
        children: <Widget>[
          buildContentTile("Hospital:", "Juth"),
          buildContentTile("Specialist:", "Dr Ajayi Bukola"),
          buildContentTile("Specialisation:", "Surgeon"),
          buildContentTile("Time:", "12:30 PM"),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                  color: Colors.redAccent,
                  iconSize: 30,
                  icon: Icon(MdiIcons.phone),
                  tooltip: "Call specialist",
                  onPressed: () {},
                ),
                Text(
                  "Contact Specialist",
                  style: tileContentLabelStyle,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                  color: Colors.redAccent,
                  iconSize: 30,
                  icon: Icon(MdiIcons.phone),
                  tooltip: "Call Hospital",
                  onPressed: () {},
                ),
                Text("Contact Hospital", style: tileContentLabelStyle)
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildContentTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: tileContentLabelStyle,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            value,
            style: tileContentStyle,
          )
        ],
      )),
    );
  }
}
