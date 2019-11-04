import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchHospitals extends StatefulWidget {
  SearchHospitals({Key key}) : super(key: key);

  @override
  _SearchHospitalsState createState() => _SearchHospitalsState();
}

class _SearchHospitalsState extends State<SearchHospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[HospitalsMap()],
      ),
    );
  }
}

class HospitalsMap extends StatelessWidget {
  const HospitalsMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: () {
            showModalBottomSheet(
                elevation: 10,
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: double.infinity,
                          color: Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Hospitals Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Anton",
                                    letterSpacing: 5),
                              ),
                              Text("Location: State and Local Govt",
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 18))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.phone,
                                    size: 30,
                                    color: Colors.greenAccent,
                                  ),
                                  Text(
                                    "CALL",
                                    style: TextStyle(
                                        fontFamily: "Anton", letterSpacing: 5),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.web,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  Text(
                                    "WEBSITE",
                                    style: TextStyle(
                                        fontFamily: "Anton", letterSpacing: 5),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.bookPlus,
                                    size: 30,
                                    color: Colors.orangeAccent,
                                  ),
                                  Text(
                                    "BOOK AP",
                                    style: TextStyle(
                                        fontFamily: "Anton", letterSpacing: 5),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(
                                        MdiIcons.mapMarker,
                                        color: Colors.blueAccent,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      "Full Address of the selected hospital",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Mansalva",
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(
                                        MdiIcons.link,
                                        color: Colors.blueAccent,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      "https://www.hospitalmedlog.com",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Mansalva",
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(
                                        MdiIcons.phoneIncoming,
                                        color: Colors.blueAccent,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      "(+234)8038691936",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.amberAccent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Text(
                                    "Book",
                                    style: TextStyle(
                                        fontFamily: "Anton",
                                        letterSpacing: 2,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Text("Click Marker"),
        ),
      ),
    );
  }
}
