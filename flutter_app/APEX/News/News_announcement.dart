import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/APEX/Home/%E8%BD%AE%E6%92%AD/banner_model.dart';
import 'package:flutter_app/APEX/Home/WebView.dart';
import 'package:flutter_app/APEX/Home/home_subview/home_news.dart';
import 'package:flutter_app/entrance.dart';
import 'package:http/http.dart' as http;

typedef void OnTapNewsCell(NewsDataModel model);

class NewsAnnouncement extends StatefulWidget {
  final OnTapNewsCell onTap;
  NewsAnnouncement({
    @required this.onTap,
  });
  @override
  _NewsAnnouncementState createState() => _NewsAnnouncementState(onTap);
}

class _NewsAnnouncementState extends State<NewsAnnouncement> with AutomaticKeepAliveClientMixin {
  List<NewsDataModel> _datas = List();
  final OnTapNewsCell onTap;
  bool newsAnnouncementhaveLoad = false;
  // final model = NewsDataModel(12, "title", "businessType", "urlType",
  //     "htmlFive", "webData", "888888", 123, "123", 234, 12);

  _NewsAnnouncementState(this.onTap);
   @override
  bool get wantKeepAlive => true;

  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var i = 0; i < 1; i++) {
    //   _datas.add(model);
    // }
    // networkrequest();
  }

  Future networkrequest() async {
    if (newsAnnouncementhaveLoad) {
      return _datas;
    }
    newsAnnouncementhaveLoad = true;

    http.Response response;
    var data = {'businessType': "2", "pageNum": "1", "pageSize": "10"};
    response = await http.get(
        'http://mapp.asiapacificex.com/mobile/data/query?businessType=3&pageNum=1&pageSize=10');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var tempArr = responseBody["result"]["result"]
          .map<NewsDataModel>((item) => NewsDataModel.fromJson(item))
          .toList();
      // _datas.removeRange(0, _datas.length - 1);
      _datas.addAll(tempArr);
      return _datas;
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
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(
          //     child: Text(
          //       'loading...',
          //       style: TextStyle(color: Color(0xffffffff)),
          //     ),
          //   );
          // }
          return Container(
            width: screenWidth,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: screenWidth,
                    child: ListView(
                      // physics: const NeverScrollableScrollPhysics(), //控制滚动的
                      reverse: false,
                      children: _datas.map((model) {
                        print(_datas.length);
                        return Container(
                            width: screenWidth,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            height: 116,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: -12,
                                  left: -15,
                                  child: IconButton(
                                    icon: Image.asset(
                                      'images/news/PDF@3x.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                    onPressed: () => {print('12345678')},
                                  ),
                                ),
                                Positioned(
                                  child: Text(
                                    "      " + model.title,
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

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
