import 'package:flutter/material.dart';

import '../../entrance.dart';

class ApexDrawer extends StatefulWidget {
  @override
  _ApexDrawerState createState() => _ApexDrawerState();
}

class _ApexDrawerState extends State<ApexDrawer> {
  final List _titles = ["Home", "Data", "News", "Me"];
  final List _icons = [
    "images/tabbar/Home@3x.png",
    "images/tabbar/Home@3x.png",
    "images/tabbar/Home@3x.png",
    "images/tabbar/Home@3x.png"
  ];

  List arr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < _titles.length; i++) {
      arr.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight,
      color: Color(0xff2c2c3a),
      child: Column(
        children: <Widget>[
          Container(
            height: topPadding + 40,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: topPadding + 12,
                    left: 20,
                    child: Text('Dashboard',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 24,
                        ))),
              ],
            ),
          ),
          Container(
              height: screenHeight - 100,
              child: ListView(
                children: arr.map((index) {
                  return Container(
                    height: 60,
                    // color: Color(0xff565656),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 18,
                            left: 20,
                            child: Image.asset(
                              _icons[index],
                              width: 24,
                              height: 24,
                            )),
                        Positioned(
                          top: 0,
                          left: 59,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _titles[index],
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 0,
                          child: Container(
                            width: screenWidth * 0.8 - 20,
                            color: Color(0xff25252F),
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ))
        ],
      ),

      // child: Stack(
      //   children: <Widget>[
      //     Positioned(
      //       top: topPadding+12,
      //       left: 20,
      //       child: Text('Dashboard',style: TextStyle(
      //         color: Color(0xffffffff),
      //         fontSize: 24,
      //       ),),
      //     ),
      //     ListView(
      //       children: arr.map((index){
      //         return Container(
      //           child: Text(_titles[index]),
      //         );
      //       }).toList(),
      //     )
      //   ],
      // )
    );
  }
}
