import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';
import 'package:flutter/cupertino.dart';
import 'me_account.dart';

import 'CommonBottomSheet.dart';

class APEXMe extends StatefulWidget {
  @override
  _APEXMeState createState() => _APEXMeState();
}

class _APEXMeState extends State<APEXMe> {
  var _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff21212b),
      height: screenHeight,
      width: screenWidth,
      child: ListView(
        children: <Widget>[
          Container(
            width: screenWidth,
            height: 170,
            color: Color(0xff21212b),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20,
                  left: 15,
                  child: Text(
                    'USERNAME',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 18),
                  ),
                ),
                Positioned(
                  top: 52,
                  left: 15,
                  child: Text(
                    'UserID12340000',
                    style: TextStyle(color: Color(0xff7E829D), fontSize: 12),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'images/pic/timg-3.jpeg',
                          image:
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1567752124&di=81715a7cad59eaff0cb15c86728e0675&src=http://hbimg.b0.upaiyun.com/0338cbe93580d5e6b0e89f25531541d455f66fda4a6a5-eVWQaf_fw658',
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                    top: 114,
                    left: 0,
                    child: IconButton(
                      icon: Image.asset(
                        'images/me/me-account@3x.png',
                        width: 24,
                        height: 24,
                      ),
                    )),
                Positioned(
                  top: 130,
                  left: 51,
                  child: Text('Account',
                      style: TextStyle(color: Color(0xffffffff))),
                ),
                Positioned(
                    top: 113,
                    right: 0,
                    child: IconButton(
                      icon: Image.asset(
                        'images/me/Details Copy 2@3x.png',
                        width: 12,
                        height: 12,
                      ),
                    )),
                Positioned(
                  top: 110,
                  left: 0,
                  right: 0,
                  height: 55,
                  child: InkWell(
                    splashColor: Color(0xff789099),
                    hoverColor: Colors.red,
                    highlightColor: Colors.yellow,
                    focusColor: Color(0xff00ffff),
                    onTap: () {
                      print("account click");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MeAccount()));
                    },
                    child: Container(
                        // color: Colors.yellow,
                        ),
                  ),
                ),
                Positioned(
                  top: 164,
                  left: 5,
                  right: 15,
                  child: Container(
                    height: 1,
                    color: Color(0xff111111),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 161,
            width: screenWidth,
            // color: Color(0xff888888),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 5,
                  left: 11,
                  child: IconButton(
                      icon: Image.asset(
                    'images/me/Favorites@3x.png',
                    width: 24,
                    height: 24,
                  )),
                ),
                Positioned(
                  top: 20,
                  left: 55,
                  child: Text('Favorites',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                        // height: 30
                      )),
                ),
                Positioned(
                  left: 55,
                  top: 40,
                  child: Container(
                    width: 104,
                    height: 30,
                    // color: Colors.yellow,
                    child: Text('Favorites&reading history',
                        style:
                            TextStyle(color: Color(0xff7E829D), fontSize: 12)),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: screenWidth / 2 + 10,
                  child: IconButton(
                      icon: Image.asset(
                    'images/me/Invite@3x.png',
                    width: 24,
                    height: 24,
                  )),
                ),
                Positioned(
                  top: 20,
                  left: screenWidth / 2 + 10 + 24 + 20,
                  child: Text('Invite Friends',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                        // height: 30
                      )),
                ),
                Positioned(
                  left: screenWidth / 2 + 10 + 24 + 20,
                  top: 40,
                  child: Container(
                    width: 104,
                    height: 30,
                    // color: Colors.yellow,
                    child: Text('Invite friends to share',
                        style:
                            TextStyle(color: Color(0xff7E829D), fontSize: 12)),
                  ),
                ),
                Positioned(
                  top: 89,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'images/me/one_stop.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 230,
            width: screenWidth,
            // color: Color(0xff898955),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 23,
                  left: 15,
                  child: Text('Night mode',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                      )),
                ),
                Positioned(
                  top: 12,
                  right: 15,
                  child: CupertinoSwitch(
                    value: _switchValue,
                    // activeColor: Color(0xffff0000), //激活颜色
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 5,
                  right: 15,
                  child: Container(
                    height: 1,
                    color: Color(0xff111111),
                  ),
                ),
                Positioned(
                  top: 83,
                  left: 15,
                  child: Text('Setting',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                      )),
                ),
                Positioned(
                  top: 143,
                  left: 15,
                  child: Text('Feedback',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                      )),
                ),
                Positioned(
                  top: 120,
                  left: 5,
                  right: 15,
                  child: Container(
                    height: 1,
                    color: Color(0xff111111),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 5,
                  right: 15,
                  child: Container(
                    height: 1,
                    color: Color(0xff111111),
                  ),
                ),
                Positioned(
                    top: 68,
                    right: 0,
                    child: IconButton(
                      icon: Image.asset(
                        'images/me/Details Copy 2@3x.png',
                        width: 12,
                        height: 12,
                      ),
                    )),
                Positioned(
                    top: 128,
                    right: 0,
                    child: IconButton(
                      icon: Image.asset(
                        'images/me/Details Copy 2@3x.png',
                        width: 12,
                        height: 12,
                      ),
                    )),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  height: 60,
                  child: InkWell(
                    hoverColor: Colors.red,
                    highlightColor: Colors.yellow,
                    onTap: () {
                      print("setting");
                    },
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  height: 60,
                  child: InkWell(
                    splashColor: Color(0xff789099),
                    hoverColor: Colors.red,
                    highlightColor: Colors.yellow,
                    focusColor: Color(0xff00ffff),
                    onTap: () {
                      print("feedback");
                    },
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 50,
                  right: 50,
                  child: FlatButton(
                    child: Text(
                      'Sign out',
                      style: TextStyle(color: Color(0xff387CFE), fontSize: 16),
                    ),
                    onPressed: () {
                      print('Sign out');
                      showDialog(
                          barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
                          context: context,
                          builder: (BuildContext context) {
                            var list = List();
                            list.add('相册');
                            list.add('相机');
                            list.add('保存图片');
                            return CommonBottomSheet(
                              list: list,
                              onItemClickListener: (index) async {
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 30,
            child: GestureDetector(
              child: Center(
                child: Text(
                  '手势',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              ),
              onTap: () {
                print('onTap');
              },
              onTapDown: (TapDownDetails details) {
                print('onTapDown' + details.localPosition.toString());
              },
            ),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //   ],
      // ),
    );
  }
}
