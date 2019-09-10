import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'drawer2.dart';
import 'bottom_navigation_bar.dart';
import 'package:flutter_app/2.ListView/listViewDemo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentPage;
  var _currentindex = 2;
  final List<Widget> _pages = [
    DrawDemo(),
    // Center(
    //   child: Text('11'),
    // ),
    DrawDemo2(),
    Center(
      child: Text('33'),
    ),
    Center(
      child: Text('44'),
    ),
    Center(
      child: ListViewDemo(),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage = _pages[_currentindex];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          //导航栏
          appBar: AppBar(
            title: Text('1.home'),
            elevation: 0.0,
            backgroundColor: Colors.pink, //

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'arrow_back',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.cake),
                color: Colors.grey,
                iconSize: 28,
                tooltip: 'cake',
                onPressed: () {
                  // Navigator.pop(context);
                  print('cake');
                },
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Color(0xff7fe1e0), //未选中颜色
              indicatorColor: Color(0xff000000), //下划线颜色
              indicatorWeight: 5, //下划线高度
              labelColor: Colors.orange, //选中颜色
              tabs: <Widget>[
                Tab(
                  text: '11',
                  icon: Icon(Icons.cake),
                ),
                Tab(
                  text: '22',
                  icon: Icon(Icons.cake),
                ),
                Tab(
                  text: '33',
                  icon: Icon(Icons.cake),
                ),
                Tab(
                  text: '44',
                  icon: Icon(Icons.cake),
                ),
                Tab(
                  text: '55',
                  icon: Icon(Icons.cake),
                ),
              ],
              onTap: (int index) => {
                setState(() {
                  _currentindex = index;
                  _currentPage = _pages[index];
                })
              },
            ),
          ),
          body: _currentPage,

          drawer: DrawDemo(),
          // bottomNavigationBar: BottomNavigationBarDemo(increaseCount: ()=>(int index){
          // _currentindex = index;
          // },),
          // bottomNavigationBar: BottomNavigationBarDemo(
          //   increaseCount: (int index) => {
          //     // index = index-1,
          //     setState(() {
          //       _currentindex = index;
          //       _currentPage = _pages[index];
          //     }),
          //     print('_onTapHandler ---index = $index'),
          //   },
          // ),
        ));
  }
}
