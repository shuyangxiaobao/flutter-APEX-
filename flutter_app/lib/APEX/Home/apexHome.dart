import 'package:flutter/material.dart';
import 'package:flutter_app/1.Home/drawer.dart';
import 'package:flutter_app/1.Home/login.dart';
import 'package:flutter_app/APEX/Home/%E8%BD%AE%E6%92%AD/banner_model.dart';
import 'package:flutter_app/APEX/Home/WebView.dart';
import 'dart:async';
import '轮播/carousel_Page.dart';
import '../../main.dart';
import 'home_subview/market_data.dart';
import 'home_subview/home_news.dart';

class APEXHome extends StatefulWidget {
  @override
  _APEXHomeState createState() => _APEXHomeState();
}

class _APEXHomeState extends State<APEXHome> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff21212b),
      body: ListView(children: <Widget>[
        CarouselPage(),
        MarketData(),
        HomeNewsData(
          onTap: (NewsDataModel model) {
            // Navigator.pushNamed(context, './webview');
            print(model);
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new WebView(
                        url: "http://mapp.asiapacificex.com" +
                            model.htmlFive +
                            "?id=" +
                            model.id.toString(),
                      )),
            );
          },
        ),
      ]),
    );
  }
}

class TopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.fromLTRB(0, 44, 0, 20),
        width: screenWidth,
        height: 88,
        color: Color(0xff21212b),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'menu',
              shape: BeveledRectangleBorder(
                //斜切的矩形边界
                borderRadius: BorderRadius.circular(0),
              ),
              child: Image.asset(
                'images/menu.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Home',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
            Container(
              child: FloatingActionButton(
                heroTag: "message",
                shape: BeveledRectangleBorder(
                  //斜切的矩形边界
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'images/Message.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
