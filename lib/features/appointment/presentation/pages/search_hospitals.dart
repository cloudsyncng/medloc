import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/bloc/bloc.dart';

import '../../../../injection_container.dart';

class SearchHospitals extends StatefulWidget {
  SearchHospitals({Key key}) : super(key: key);

  @override
  _SearchHospitalsState createState() => _SearchHospitalsState();
}

class _SearchHospitalsState extends State<SearchHospitals> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        body: BlocProvider(
      builder: (context) => sl<MedlogBloc>(),
      child: Stack(
        children: <Widget>[
          HospitalsMap(),
          Positioned(
            top: 50,
            left: 25,
            child: Container(
              width: ScreenUtil.getInstance().setWidth(650),
              height: ScreenUtil.getInstance().setHeight(100),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.blueGrey, width: 2.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text("Search"),
                  IconButton(
                    icon: Icon(MdiIcons.mapSearchOutline),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              height: ScreenUtil.getInstance().setHeight(300),
              width: ScreenUtil.getInstance().width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: ScreenUtil.getInstance().setWidth(350),
                    height: ScreenUtil.getInstance().height,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: ScreenUtil.getInstance().setWidth(350),
                    height: ScreenUtil.getInstance().height,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: ScreenUtil.getInstance().setWidth(350),
                    height: ScreenUtil.getInstance().height,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: ScreenUtil.getInstance().setWidth(350),
                    height: ScreenUtil.getInstance().height,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class HospitalsMap extends StatefulWidget {
  @override
  _HospitalsMapState createState() => _HospitalsMapState();
}

class _HospitalsMapState extends State<HospitalsMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.917513, 8.897940),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<MedlogBloc>(),
      child: BlocBuilder<MedlogBloc, MedlogState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<MedlogBloc>(context)
                .add(GetHospitalsWithSpecialityEvent(query: query));
            return Container();
          } else if (state is Loading) {
            return Container();
          } else if (state is Loaded) {
          } else if (state is Error) {
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

//class HospitalsMap extends StatelessWidget {
//  const HospitalsMap({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return new MBottonSheet();
//  }
//}
//
//class MBottonSheet extends StatelessWidget {
//  const MBottonSheet({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Center(
//        child: MaterialButton(
//          color: Colors.blueAccent,
//          onPressed: () {
//            showModalBottomSheet(
//                elevation: 10,
//                context: context,
//                builder: (context) {
//                  return Container(
//                    height: MediaQuery.of(context).size.height * 0.6,
//                    decoration: BoxDecoration(),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 70,
//                          width: double.infinity,
//                          color: Colors.blueAccent,
//                          child: Column(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Text(
//                                "Hospitals Name",
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 22,
//                                    fontFamily: "Anton",
//                                    letterSpacing: 5),
//                              ),
//                              Text("Location: State and Local Govt",
//                                  style: TextStyle(
//                                      color: Colors.white54, fontSize: 18))
//                            ],
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.all(10.0),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              Column(
//                                children: <Widget>[
//                                  Icon(
//                                    MdiIcons.phone,
//                                    size: 30,
//                                    color: Colors.greenAccent,
//                                  ),
//                                  Text(
//                                    "CALL",
//                                    style: TextStyle(
//                                        fontFamily: "Anton", letterSpacing: 5),
//                                  )
//                                ],
//                              ),
//                              Column(
//                                children: <Widget>[
//                                  Icon(
//                                    MdiIcons.web,
//                                    size: 30,
//                                    color: Colors.lightBlueAccent,
//                                  ),
//                                  Text(
//                                    "WEBSITE",
//                                    style: TextStyle(
//                                        fontFamily: "Anton", letterSpacing: 5),
//                                  )
//                                ],
//                              ),
//                              Column(
//                                children: <Widget>[
//                                  Icon(
//                                    MdiIcons.bookPlus,
//                                    size: 30,
//                                    color: Colors.orangeAccent,
//                                  ),
//                                  Text(
//                                    "BOOK AP",
//                                    style: TextStyle(
//                                        fontFamily: "Anton", letterSpacing: 5),
//                                  )
//                                ],
//                              )
//                            ],
//                          ),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 10, left: 10),
//                          child: Column(
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.only(bottom: 20),
//                                child: Row(
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(right: 15),
//                                      child: Icon(
//                                        MdiIcons.mapMarker,
//                                        color: Colors.blueAccent,
//                                        size: 30,
//                                      ),
//                                    ),
//                                    Text(
//                                      "Full Address of the selected hospital",
//                                      style: TextStyle(
//                                        fontSize: 18,
//                                        fontFamily: "Anton",
//                                        color: Colors.blueAccent,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(bottom: 20),
//                                child: Row(
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(right: 15),
//                                      child: Icon(
//                                        MdiIcons.link,
//                                        color: Colors.blueAccent,
//                                        size: 30,
//                                      ),
//                                    ),
//                                    Text(
//                                      "https://www.hospitalmedlog.com",
//                                      style: TextStyle(
//                                        fontSize: 18,
//                                        fontFamily: "Anton",
//                                        color: Colors.blueAccent,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(bottom: 20),
//                                child: Row(
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(right: 15),
//                                      child: Icon(
//                                        MdiIcons.phoneIncoming,
//                                        color: Colors.blueAccent,
//                                        size: 30,
//                                      ),
//                                    ),
//                                    Text(
//                                      "(+234)8038691936",
//                                      style: TextStyle(
//                                        fontSize: 18,
//                                        fontFamily: "Anton",
//                                        color: Colors.blueAccent,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                              MaterialButton(
//                                onPressed: () {},
//                                color: Colors.amberAccent,
//                                child: Padding(
//                                  padding: const EdgeInsets.symmetric(
//                                      horizontal: 40),
//                                  child: Text(
//                                    "Book",
//                                    style: TextStyle(
//                                        fontFamily: "Anton",
//                                        letterSpacing: 2,
//                                        color: Colors.white,
//                                        fontSize: 18),
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  );
//                });
//          },
//          child: Text("Click Marker"),
//        ),
//      ),
//    );
//  }
//}
