import 'package:flutter/material.dart';
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
  String phone = "##############";
  _makeCall() async {
    if (await canLaunch("tel:$phone")) {
      await launch("tel:$phone");
    } else {
      throw "could not call $phone";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
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
              margin: EdgeInsets.only(top: 10),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      phone,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: _makeCall,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "HOTLINE",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            width: 15,
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
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10))),
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
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(dbBtns[index].url);
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
    );
  }
}
