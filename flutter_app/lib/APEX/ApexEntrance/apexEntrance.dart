import 'package:flutter/material.dart';
import 'package:flutter_app/1.Home/bottom_navigation_bar.dart';
import 'package:flutter_app/1.Home/drawer.dart';
import 'package:flutter_app/APEX/Home/apexHome.dart';
import 'package:flutter_app/APEX/Me/apex_me.dart';
import 'package:flutter_app/APEX/News/apexNews.dart';
import 'package:flutter_app/entrance.dart';

import 'apex_drawer.dart';

class ApexEntrance extends StatefulWidget {
  @override
  _ApexEntranceState createState() => _ApexEntranceState();
}

class _ApexEntranceState extends State<ApexEntrance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _currentPage;
  var _currentindex = 0;
  final List<Widget> _pages = [
    APEXHome(),
    Center(
      child: Text('22'),
    ),
    ApexNews(),
    APEXMe(),
  ];

  final List _titles = ["Home", "Data", "News", "Me"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage = _pages[_currentindex];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(_titles[_currentindex]),
          backgroundColor: Color(0xff21212b),
          leading: IconButton(
            icon: Image.asset(
              'images/menu.png',
              width: 24,
              height: 24,
            ),
            // tooltip: '',
            onPressed: () => _scaffoldKey.currentState.openDrawer(), //手动打开抽屉
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Image.asset(
                'images/Message.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        // body: _currentPage,
        body: IndexedStack(
          index: _currentindex,
          children: _pages,
        ),

        bottomNavigationBar: BottomNavigationBarDemo(
          increaseCount: (int index) => {
            // index = index-1,
            setState(() {
              _currentindex = index;
              _currentPage = _pages[index];
            }),
            print('_onTapHandler ---index = $index'),
          },
        ),
        drawer: ApexDrawer(),
      ),
    );
  }
}
