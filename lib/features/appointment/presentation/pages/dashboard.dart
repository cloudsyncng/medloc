import 'package:flutter/material.dart';
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
        drawer: Drawer(),
        appBar: AppBar(
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
                    height: 200,
                    color: Colors.blueAccent,
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
