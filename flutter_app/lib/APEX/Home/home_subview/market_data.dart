import 'package:flutter/material.dart';
import 'package:flutter_app/APEX/Home/%E8%BD%AE%E6%92%AD/banner_model.dart';
import 'package:flutter_app/entrance.dart';

class MarketData extends StatefulWidget {
  @override
  _MarketDataState createState() => _MarketDataState();
}

class _MarketDataState extends State<MarketData> {
  var model = MarketDataModel(
      instrumentId: 'FO1910',
      volume: "Vol:8096",
      openInterest: "OI:1023",
      lastPrice: "518.50",
      upperLowerPercent: "-2.68%",
      isCollect: true);
  var model2 = MarketDataModel(
      instrumentId: 'CPF1912',
      volume: "Vol:6439",
      openInterest: "OI:3282",
      lastPrice: "524.50",
      upperLowerPercent: "-2.37%",
      isCollect: true);
  var model3 = MarketDataModel(
      instrumentId: 'PF1912',
      volume: "Vol:288",
      openInterest: "OI:291",
      lastPrice: "540.25",
      upperLowerPercent: "-2.44%",
      isCollect: true);
  var model4 = MarketDataModel(
      instrumentId: 'UC1909W2',
      volume: "Vol:30",
      openInterest: "OI:88",
      lastPrice: "518.50",
      upperLowerPercent: "-1.03%",
      isCollect: true);
  List<MarketDataModel> datas = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas..add(model)..add(model2)..add(model3)..add(model4);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
      width: screenWidth,
      height: 380,
      // color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SizedBox(width: 15,),
                Text(
                  'Market data',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
                // posit
                IconButton(
                    onPressed: () => {
                          Navigator.pop(context),
                        },
                    icon: Image.asset(
                      'images/more.png',
                      width: 24,
                      height: 24,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: screenWidth,
              height: 304,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                reverse: false,
                // children: datas.map((model0) => _buildItem(model0)).toList(),
                children: datas.map((model) {
                  return Container(
                    width: screenWidth,
                    height: 76,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        // ContainerDemo(),
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 9,
                                left: 20,
                                child: Text(
                                  model.instrumentId,
                                  style: TextStyle(
                                    color: Color(0xfffffffff),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 39,
                                left: 20,
                                child: Text(
                                  model.volume,
                                  style: TextStyle(
                                    color: Color(0xff7E829D),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 39,
                                left: 91,
                                child: Text(
                                  model.openInterest,
                                  style: TextStyle(
                                    color: Color(0xff7E829D),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 9,
                                right: 83,
                                child: Text(
                                  model.lastPrice,
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 33,
                                right: 83,
                                width: 55,
                                height: 26,
                                child: Container(
                                    // color: Color(0xffFC3E30),
                                    width: 50,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFC3E30),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)), // 四个角圆角
                                      shape: BoxShape.rectangle,
                                      //盒子形状 注意：和设置圆角有冲突
                                    ),
                                    child: Center(
                                      child: Text(
                                        model.upperLowerPercent,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffffffff)),
                                      ),
                                    )),
                              ),
                              Positioned(
                                top: 10,
                                right: 20,
                                bottom: 10,
                                // width: 24,
                                // height: 24,
                                child: IconButton(
                                  icon: Image.asset(
                                      'images/Collection-Click@3x.png'),
                                  onPressed: () => {print('12345678')},
                                ),
                              )
                            ],
                          ),
                          width: screenWidth - 30,
                          height: 68,
                          //设置圆角
                          decoration: BoxDecoration(
                            color: Color(0xff282834),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)), // 四个角圆角
                            shape: BoxShape.rectangle,
                            //盒子形状 注意：和设置圆角有冲突
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
