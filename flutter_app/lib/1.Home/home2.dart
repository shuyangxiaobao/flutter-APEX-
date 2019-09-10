import 'package:flutter/material.dart';
import 'drawer.dart';
import 'drawer2.dart';
import 'bottom_navigation_bar.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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
                child: Text('55'),
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
    return  DefaultTabController(
          length: 5,
          child: Scaffold(
            //导航栏
          appBar: AppBar(
              title: Text('home2'),
              elevation: 0.0,
              backgroundColor: Colors.pink, //

              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  tooltip: 'arrow_back',
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cake),
                  color: Colors.grey, 
                  iconSize: 28,
                  tooltip: 'cake',
                  onPressed: (){
                    // Navigator.pop(context);
                    print('cake');
                  }, 
                ),
              ],
              bottom: TabBar(
                unselectedLabelColor: Color(0xff7fe1e0), //未选中颜色       
                indicatorColor: Color(0xff000000), //下划线颜色
                indicatorWeight: 5, //下划线高度
                labelColor: Colors.orange,  //选中颜色
                tabs: <Widget>[
                  Tab(text: '11',icon: Icon(Icons.cake),),
                  Tab(text: '22',icon: Icon(Icons.cake),),
                  Tab(text: '33',icon: Icon(Icons.cake),),
                  Tab(text: '44',icon: Icon(Icons.cake),),
                  Tab(text: '55',icon: Icon(Icons.cake),),
                ],
              ),
            ),
            // body: _currentPage,

          body: TabBarView(
            children: <Widget>[
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
                child: Text('55'),
              ),
              
            ],
          ),    
          )
    );
  }
}

