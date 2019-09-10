import 'package:flutter/material.dart';
import 'package:flutter_app/APEX/ApexEntrance/apexEntrance.dart';
import 'package:flutter_app/APEX/Home/apexHome.dart';
import 'main.dart';
import 'package:flutter_app/1.Home/home.dart';
import 'package:flutter_app/1.Home/home2.dart';
import '1.Home/login.dart';
import 'APEX/Home/轮播/carousel_Page.dart';
import 'oc_flutter/TwoCommunicate.dart';
double screenWidth = 0.0;
double screenHeight = 0.0;
double topPadding = 0.0;
double bottomPadding = 0.0;

class Entrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = MediaQuery.of(context).padding.top; //状态栏高度  iphoneX:44
    bottomPadding = MediaQuery.of(context).padding.bottom; //底部tabbar高度  iphoneX:34
    return Scaffold(
      appBar: AppBar(
        title: Text('day11demo'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "Home",
            page: Home(),
          ),
          ListItem(
            title: "Home2",
            page: Home2(),
          ),
          ListItem(
            title: "LoginApex",
            page: LoginApex(),
          ),
          ListItem(
            title: "APEXHome",
            page: APEXHome(),
          ),
          ListItem(
            title: "CarouselPage",
            page: CarouselPage(),
          ),

           ListItem(
            title: "APEX Entrance",
            page: ApexEntrance(),
          ),
           ListItem(
            title: "OC flutter 交互",
            page: TwoCommunicate(),
          ),

          

        ],
      ),
    );

  }
}
