import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/pages/feedback_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/home_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/news_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/settings_page.dart';
import 'package:med_plus/features/appointment/presentation/pages/todos_page.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  PageController pageController = PageController();
  var mpages = pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            iconSize: 35,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: ElasticOutCurve());
                print(_currentIndex);
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  title: Text("Home"), icon: Icon(MdiIcons.home)),
              BottomNavigationBarItem(
                  title: Text("Task"), icon: Icon(MdiIcons.check)),
              BottomNavigationBarItem(
                  title: Text("Feedback"), icon: Icon(MdiIcons.calendarEdit)),
              BottomNavigationBarItem(
                  title: Text("News"), icon: Icon(MdiIcons.account)),
              BottomNavigationBarItem(
                  title: Text("Settings"), icon: Icon(MdiIcons.settings)),
            ],
          ),
        ),
        body: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: pageController,
          itemCount: mpages.length,
          itemBuilder: (context, index) {
            return mpages[_currentIndex];
          },
        ));
  }
}

List<Widget> pages = [
  HomePage(),
  TaskPage(),
  FeedbackPage(),
  NewsPage(),
  SettingsPage()
];
