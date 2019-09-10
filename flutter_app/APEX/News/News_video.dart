import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/APEX/Home/%E8%BD%AE%E6%92%AD/banner_model.dart';
import 'package:flutter_app/APEX/Home/WebView.dart';
import 'package:flutter_app/APEX/Home/home_subview/home_news.dart';
import 'package:flutter_app/entrance.dart';
import 'package:http/http.dart' as http;

typedef void OnTapNewsCell(VideoModel model);

class NewsVideo extends StatefulWidget {
  final OnTapNewsCell onTap;
  NewsVideo({
    @required this.onTap,
  });
  @override
  _NewsVideoState createState() => _NewsVideoState(onTap);
}

class _NewsVideoState extends State<NewsVideo> with AutomaticKeepAliveClientMixin {
  List<VideoModel> _datas = List();
  final OnTapNewsCell onTap;
  bool newsVideoHaveLoad = false;

  _NewsVideoState(this.onTap);
   @override
  bool get wantKeepAlive => true;

  void initState() {
    // TODO: implement initState
    super.initState();
    // networkrequest();
  }

  Future networkrequest() async {
    if (newsVideoHaveLoad) {
      return _datas;
    }
    newsVideoHaveLoad = true;

    http.Response response;
    // var data = {'businessType': "2", "pageNum": "1", "pageSize": "10"};
    response = await http.get(
        'http://mapp.asiapacificex.com/mobile/videos/query?pageNum=1&pageSize=5');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      _datas = responseBody["result"]["result"]
          .map<VideoModel>((item) => VideoModel.fromJson(item))
          .toList();
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
            height: 500,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: screenWidth,
                    child: ListView(
                      // physics: const NeverScrollableScrollPhysics(), //控制滚动的
                      reverse: false,
                      children: _datas.map((model) {
                        print(_datas.length.toString() + '322332');
                        return Container(
                            width: screenWidth,
                            // color: Color(0xffff0000),
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            height: 160,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "images/pic/timg-1.jpeg",
                                      image: "http://mapp.asiapacificex.com" +
                                          model.photo,
                                      fit: BoxFit.cover,
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
