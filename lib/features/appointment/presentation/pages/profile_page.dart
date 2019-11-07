import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(color: Colors.blueAccent)),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  MdiIcons.account,
                  size: 100,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Material(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          MdiIcons.arrowLeft,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 170,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.blueGrey, width: 1)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text("ISMAILAWA ALIYU",
                      style: TextStyle(
                          fontSize: 22, fontFamily: "Anton", letterSpacing: 5)),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone_forwarded,
                    color: Colors.blueAccent,
                  ),
                  title: Text("08033669999"),
                  subtitle: Text("Phone"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  title: Text("ismailawa.aliyu@gmail.com"),
                  subtitle: Text("Email"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.dehaze,
                    color: Colors.blueAccent,
                  ),
                  title: Text("15-07-1989"),
                  subtitle: Text("DOB"),
                ),
                ListTile(
                  leading: Icon(
                    MdiIcons.bloodBag,
                    color: Colors.redAccent,
                  ),
                  title: Text("A+"),
                  subtitle: Text("Blood Group"),
                ),
                ListTile(
                  leading: Icon(
                    MdiIcons.bloodBag,
                    color: Colors.redAccent,
                  ),
                  title: Text("AA"),
                  subtitle: Text("Gynotype"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 80);
//     path.lineTo(size.width / 2, size.height);
//     path.lineTo(size.width, size.height - 80);
//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
