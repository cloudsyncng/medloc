import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/utils/styles.dart';
import 'package:med_plus/features/appointment/presentation/widgets/bashboard_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String phone = "08033556699";
  _makeCall() async {
    if (await canLaunch("tel:$phone")) {
      await launch("tel:$phone");
    } else {
      throw "could not call $phone";
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.local_hospital,
                    size: 70,
                    color: Colors.red,
                  ),
                  Text(
                    "MEDLOG APPLICATION",
                    style: headerStyle,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil.getInstance().setWidth(20)),
                height: ScreenUtil.getInstance().setHeight(80),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(80)),
                      child: Text(
                        phone,
                        style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(32)),
                      ),
                    ),
                    GestureDetector(
                      onTap: _makeCall,
                      child: Container(
                        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20), right: ScreenUtil.getInstance().setWidth(20)),
                        height: ScreenUtil.getInstance().height,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "HOTLINE",
                              style:
                                  TextStyle(fontSize: ScreenUtil.getInstance().setSp(30), color: Colors.white),
                            ),
                            SizedBox(
                              width: ScreenUtil.getInstance().setWidth(20),
                            ),
                            Icon(
                              MdiIcons.phoneOutgoing,
                              color: Colors.white,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(ScreenUtil.getInstance().setWidth(20)),
                                topRight: Radius.circular(ScreenUtil.getInstance().setWidth(20)))),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    itemCount: dbBtns.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: ScreenUtil.getInstance().setWidth(20),
                        mainAxisSpacing: ScreenUtil.getInstance().setWidth(20)),
                    itemBuilder: (context, index) {
                      return Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, dbBtns[index].url);
                          },
                          child: DbBtn(
                            dbBtnModel: dbBtns[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
