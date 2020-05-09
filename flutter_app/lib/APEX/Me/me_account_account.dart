import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';


class MeAccountAccount extends StatefulWidget {
  @override
  _MeAccountAccountState createState() => _MeAccountAccountState();
}

class _MeAccountAccountState extends State<MeAccountAccount> {
  Widget createText(String title, double size, Color color) {
    return Text(
      title,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  Widget createLine(Color color) {
    return Container(
      width: screenWidth,
      height: 1,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: ListView(
        children: <Widget>[
          Container(
            width: screenWidth,
            height: getAutosize(249),
            color: Color(0xff21212b),
            // color: Colors.orange,
            child: Stack(
              children: <Widget>[
                // 下划线
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: screenWidth,
                    height: 2,
                    color: Color(0xffff0000),
                  ),
                ),
                Positioned(
                  top: 11,
                  left: 15,
                  child: Container(
                    child: Text(' MNP10000031 ',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 18,
                        )),
                    // decoration: BoxDecoration(
                    //   // color: Color(0xff7E829D),
                    //   borderRadius:
                    //       BorderRadius.all(Radius.circular(4)), // 四个角圆角
                    //   shape: BoxShape.rectangle,
                    //   border: new Border.all(
                    //       color: Color(0xFFFF0000), width: 0.5), // 边色与边宽度
                    // ),
                  ),
                ),
// CNY
                Positioned(
                  top: 14,
                  left: 150,
                  child: Container(
                    width: 36,
                    height: 18,
                    child: Text('CNY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff7E829D),
                        )),
                    decoration: BoxDecoration(
                      // color: Color(0xff7E829D),
                      borderRadius:
                          BorderRadius.all(Radius.circular(3)), // 四个角圆角
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                          color: Color(0xFF7E829D), width: 1.0), // 边色与边宽度
                    ),
                  ),
                ),
                Positioned(
                    top: getAutosize(42),
                    left: getAutosize(15),
                    child:
                        this.createText('Investor ID', 12, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(62),
                    left: getAutosize(15),
                    child: this.createText('Broker ID', 12, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(42),
                    right: getAutosize(15),
                    child:
                        this.createText('MNP10000031', 12, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(62),
                    right: getAutosize(15),
                    child: this.createText('0001', 12, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(110),
                    left: getAutosize(15),
                    child: this.createText('PreBlance', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(110),
                    left: getAutosize(113),
                    child: this.createText('Available', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(110),
                    right: getAutosize(71),
                    child: this.createText('Margin', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(180),
                    left: getAutosize(15),
                    child: this.createText('Risk%', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(180),
                    left: getAutosize(113),
                    child: this.createText('Equity', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(180),
                    left: getAutosize(258),
                    child: this.createText('Fees', 14, Color(0xff7E829D))),
                Positioned(
                    top: getAutosize(135),
                    left: getAutosize(15),
                    child: this.createText('0.00', 18, Color(0xff0279FF))),

                Positioned(
                    top: getAutosize(135),
                    left: getAutosize(133),
                    child: this.createText('0.00', 18, Color(0xff0279FF))),

                Positioned(
                    top: getAutosize(135),
                    left: getAutosize(258),
                    child: this.createText('1000.00', 18, Color(0xffffffff))),
                Positioned(
                    top: getAutosize(205),
                    left: getAutosize(15),
                    child: this.createText('0.00', 18, Color(0xff0279FF))),
                Positioned(
                    top: getAutosize(205),
                    left: getAutosize(133),
                    child: this.createText('0.00', 18, Color(0xff0279FF))),
                Positioned(
                    top: getAutosize(205),
                    left: getAutosize(258),
                    child: this.createText('1000.00', 18, Color(0xffffffff))),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: getAutosize(312),
            // color: Colors.green,
            child: Stack(
              children: <Widget>[
                // 左边7个标签
                Positioned(
                  top: getAutosize(15),
                  left: getAutosize(16),
                  child: createText("Realized P/L", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(46),
                  left: getAutosize(16),
                  child: createText("Unrealized P/L", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(97),
                  left: getAutosize(16),
                  child: createText("Position Margin", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(127),
                  left: getAutosize(16),
                  child: createText("Order Margin", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(157),
                  left: getAutosize(16),
                  child: createText("Premium", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(208),
                  left: getAutosize(16),
                  child: createText("Deposit", 14, Color(0xff7E829D)),
                ),
                Positioned(
                  top: getAutosize(238),
                  left: getAutosize(16),
                  child: createText("Withdraw", 14, Color(0xff7E829D)),
                ),

                //  右边数值
                Positioned(
                  top: getAutosize(16),
                  right: getAutosize(15),
                  child: createText("0.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(46),
                  right: getAutosize(15),
                  child: createText("-2290.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(97),
                  right: getAutosize(15),
                  child: createText("1030.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(127),
                  right: getAutosize(15),
                  child: createText("0.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(157),
                  right: getAutosize(15),
                  child: createText("0.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(208),
                  right: getAutosize(15),
                  child: createText("0.0", 14, Color(0xffffffff)),
                ),
                Positioned(
                  top: getAutosize(238),
                  right: getAutosize(15),
                  child: createText("0.0", 14, Color(0xffffffff)),
                ),

// 下划线
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: createLine(Color(0xff14141E)),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 81,
                  child: createLine(Color(0xff14141E)),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 191,
                  child: createLine(Color(0xff14141E)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

