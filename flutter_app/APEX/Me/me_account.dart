import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'me_account_account.dart';
import 'package:flutter_wechat/flutter_wechat.dart';

class MeAccount extends StatefulWidget {
  @override
  _MeAccountState createState() => _MeAccountState();
}

class _MeAccountState extends State<MeAccount> {
  var _currentPage;
  var _currentindex = 0;
  List<Widget> _pages = List();

  void initData(BuildContext context) {
    _pages = [
      MeAccoountAccount(),
      Center(
        child: Text('22'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff282834),
        title: Text(
          'Account',
          style: TextStyle(color: Color(0xffffffff), fontSize: 20),
        ),
        actions: <Widget>[
          FloatingActionButton(
            // child: Icon(Icons.assistant_photo),
            child: Text('微信分享'),
            onPressed: () async {
              // await FlutterWechat.shareText(text: "test", type:0,);
// FlutterWechat.shareImage(imgUrl: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4177674530,2478208275&fm=26&gp=0.jpg", type:0,);

              await FlutterWechat.shareWebPage(
                imgUrl:
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4177674530,2478208275&fm=26&gp=0.jpg",
                webpageUrl: "http://www.baidu.com",
                title: "title",
                description: "description",
                type: 0,
              );
            },
          )
        ],
      ),
      body: DefaultTabController(
          length: _pages.length,
          child: Scaffold(
            backgroundColor: Color(0xff21212b),
            //导航栏
            appBar: TabBar(
              unselectedLabelColor: Color(0xff7E829D), //未选中颜色
              indicatorColor: Color(0xff387CFE), //下划线颜色
              indicatorWeight: 2, //下划线高度
              labelColor: Colors.white, //选中颜色
              isScrollable: false, // 顶部菜单标题可以滚动

              tabs: <Widget>[
                Center(
                  child: Text('Positions'),
                ),
                Center(
                  child: Text('Account'),
                ),
              ],
              onTap: (int index) => {
                setState(() {
                  _currentindex = index;
                  _currentPage = _pages[index];
                })
              },
            ),
// 3.可以滑动，可以保持页面
            body: TabBarView(
              children: _pages,
              // physics: NeverScrollableScrollPhysics(),
            ),
          )),
    );
  }
}
