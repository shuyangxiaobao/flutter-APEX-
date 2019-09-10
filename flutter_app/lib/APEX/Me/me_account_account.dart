import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';
// import 'package:flutter_wechat/flutter_wechat.dart';

class MeAccoountAccount extends StatefulWidget {
  @override
  _MeAccoountAccountState createState() => _MeAccoountAccountState();
}

class _MeAccoountAccountState extends State<MeAccoountAccount> {
  List _datas = List();
  List _titles = List();
  List _dataSource = List();

  Future initData(BuildContext context) async {
    _datas = [0, 1, 2, 3, 4];
    _titles = ["Contract", "", "Direction", "Price", "Oty", "P/L888"];
    _dataSource = ["PF1901", "", "Long", "525.25", "0", "100.00"];
    // await FlutterWechat.registerWechat("wx4ef6d7f87a1e0ebc");// 微信注册需要在你需要的地方注册，最好是app首页
// 分享
  }

  // @override
  // Future initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   _datas = [0, 1, 2, 3, 4];
  //   _titles = ["Contract", "", "Direction", "Price", "Oty", "P/L"];
  //   _dataSource = ["PF1901", "", "Long", "525.25", "0", "100.00"];
  //   // await FlutterWechat.registerWechat("wxxxxxx");// 微信注册需要在你需要的地方注册，最好是app首页

  //   //         FlutterWechat.registerWechat("wx7e2d791ff79cdbd9");
  // }

  TextStyle titleStyle = TextStyle(
    color: Color(0xff7E829D),
    fontSize: 11,
  );

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Container(
      child: ListView(
          children: _datas.map((index) {
        return Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: screenWidth,
            height: 30,
            child: index == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _titles.map((title) {
                      return Container(
                        width: screenWidth / 6,
                        child: Text(
                          title,
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _dataSource.map((title) {
                      return Container(
                        width: screenWidth / 6,
                        child: Text(
                          title,
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                  ));
      }).toList()),
    );
  }
}
