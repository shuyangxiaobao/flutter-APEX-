import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';
import 'package:flutter_app/APEX/Home/%E8%BD%AE%E6%92%AD/banner_model.dart';
import 'package:http/http.dart' as http;

typedef void OnTapNewsCell(NewsDataModel model);

class HomeNewsData extends StatefulWidget {
  final OnTapNewsCell onTap;
  HomeNewsData({
    @required this.onTap,
  });

  @override
  _HomeNewsDataState createState() => _HomeNewsDataState(this.onTap);
}

class _HomeNewsDataState extends State<HomeNewsData> {
  List<NewsDataModel> _datas = List();
  final OnTapNewsCell onTap;
  bool haveLoad = false;
  // final model = NewsDataModel(12, "title", "businessType", "urlType",
  //     "htmlFive", "webData", "888888", 123, "123", 234,12);

  _HomeNewsDataState(this.onTap);

  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var i = 0; i < 10; i++) {
    //   _datas.add(model);
    // }
    // networkrequest();
  }

  Future networkrequest() async {
    if (haveLoad) {
      return _datas;
    }
    haveLoad = true;

    http.Response response;
    var data = {'businessType': "2", "pageNum": "1", "pageSize": "10"};
    response = await http.get(
        'http://mapp.asiapacificex.com/mobile/data/query?businessType=2&pageNum=1&pageSize=10');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // print('000000');
      // print(responseBody["message"]);
      // print(responseBody.toString());
      // print(responseBody["result"]["result"]);
      _datas = responseBody["result"]["result"]
          .map<NewsDataModel>((item) => NewsDataModel.fromJson(item))
          .toList();
      print('34567890');
      return _datas;
      print('11111111');

      print(_datas);
      for (var obj in _datas) {
        print(obj);
      }

      print(responseBody);
    }
  }

  String readTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp)
        .toString()
        .substring(0, 16);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: networkrequest(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'loading...',
                style: TextStyle(color: Color(0xffffffff)),
              ),
            );
          }
          return Container(
            width: screenWidth,
            height: _datas.length * 116.0 + 40.0,
            child: Column(
              children: <Widget>[
                Container(
                  // color: Color(0xffff0000),
                  width: screenWidth,
                  height: 36,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 10,
                        left: 15,
                        child: Text(
                          'News',
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: IconButton(
                            icon: Image.asset(
                              'images/more.png',
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () => {print('xlp1')},
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    height: 80,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: false,
                      // children: datas.map((model0) => _buildItem(model0)).toList(),
                      children: _datas.map((model) {
                        print(_datas.length);
                        return Container(
                            width: screenWidth,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            height: 116,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    model.title,
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 14,
                                      height: 1.3,
                                      // backgroundColor: Color(0xffff0000)
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 57,
                                  left: 0,
                                  child: Text(
                                    // model.createDate.toString(),
                                    readTimestamp(model.createDate),
                                    style: TextStyle(
                                      color: Color(0xff7E829D),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 55,
                                  left: 120,
                                  child: Text(
                                    model.browseNum.toString() + "浏览",
                                    style: TextStyle(
                                      color: Color(0xff7E829D),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => {this.onTap(model)},
                                )
                              ],
                            ));
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
