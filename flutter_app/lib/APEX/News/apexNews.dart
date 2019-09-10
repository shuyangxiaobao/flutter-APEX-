import 'package:flutter/material.dart';
import 'package:flutter_app/1.Home/drawer.dart';
import 'package:flutter_app/1.Home/drawer2.dart';
import 'package:flutter_app/2.ListView/listViewDemo.dart';
import 'package:flutter_app/APEX/Home/WebView.dart';
import 'News_announcement.dart';
// import 'package:flutter_app/APEX/News/News_announcement.dart';

import 'News_news.dart';
import 'News_research.dart';
import 'News_video.dart';
import 'Video_player.dart';

class ApexNews extends StatefulWidget {
  @override
  _ApexNewsState createState() => _ApexNewsState();
}

class _ApexNewsState extends State<ApexNews> {
  var _currentPage;
  var _currentindex = 0;
  List<Widget> _pages = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _currentPage = _pages[_currentindex];
  }

  void inisData(BuildContext context) {
    _pages = [
      Newsnews(
        onTap: (model) {
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
      NewsAnnouncement(
        onTap: (model) {
          print(model);
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new WebView(
                      url: "http://mapp.asiapacificex.com" + model.url,
                    )),
          );
        },
      ),
      NewsVideo(
        onTap: (model) {
          print(model);
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new APEXVideoPlayer()),
          );
        },
      ),
      NewsResearch(
        onTap: (model) {
          print(model);
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new WebView(
                      url: "http://mapp.asiapacificex.com" + model.url,
                    )),
          );
        },
      ),
    ];
    _currentPage = _pages[_currentindex];
  }

  @override
  Widget build(BuildContext context) {
    inisData(context);
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xff21212b),
          //导航栏
          appBar: TabBar(
            unselectedLabelColor: Color(0xff7E829D), //未选中颜色
            indicatorColor: Color(0xff387CFE), //下划线颜色
            indicatorWeight: 2, //下划线高度
            labelColor: Colors.white, //选中颜色
            isScrollable: true, // 顶部菜单标题可以滚动
            tabs: <Widget>[
              Center(
                child: Text('News'),
              ),
              Center(
                child: Text('Announcement'),
              ),
              Center(
                child: Text('Videos'),
              ),
              Center(
                child: Text('Research'),
              ),
            ],
            onTap: (int index) => {
              setState(() {
                _currentindex = index;
                _currentPage = _pages[index];
              })
            },
          ),

          // body: _currentPage,

          // // //1.可以做到切换页面，页面保持，但是不能滑动
          // body: IndexedStack(
          //   children: _pages,
          //   index: _currentindex,
          // ),

          // //2.可以做到切换页面，页面保持，但是不能滑动
          // body: Stack(
          //   children: <Widget>[
          //      Offstage(
          //     offstage: _currentindex != 0,
          //     child: _pages[0],
          //   ),
          //   Offstage(
          //     offstage: _currentindex != 1,
          //     child: _pages[1],
          //   ),
          //   Offstage(
          //     offstage: _currentindex != 2,
          //     child: _pages[2],
          //   ),
          //    Offstage(
          //     offstage: _currentindex != 3,
          //     child: _pages[3],
          //   ),

// 3.可以滑动，可以保持页面
          body: TabBarView(
            children: _pages,
            // physics: NeverScrollableScrollPhysics(),
          ),
        ));
  }
}
