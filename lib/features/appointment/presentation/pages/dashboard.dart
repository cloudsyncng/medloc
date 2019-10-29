import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/widgets/bashboard_btn.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                accountEmail: Text(
                  "useremail@email.com",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                accountName: Text(
                  "Users Name",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        MdiIcons.shieldSearch,
                        color: Colors.blue,
                        size: 40,
                      ),
                      title: Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("MEDLOG"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        image: DecorationImage(
                            image: ExactAssetImage("assets/images/bg.jpg"),
                            fit: BoxFit.fill)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Some caption goes here",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 150, left: 15, right: 15, bottom: 20),
                child: Container(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 20),
                    itemCount: dbBtns.length,
                    itemBuilder: _btnBuilder,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _btnBuilder(context, index) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        Navigator.of(context).pushNamed(dbBtns[index].url);
      },
      child: DbBtn(dbBtnModel: dbBtns[index]),
    );
  }
}
