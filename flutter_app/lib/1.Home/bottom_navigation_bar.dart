import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  final int CurrentIndex = 0;
  final void Function(int index) increaseCount; //传递匿名函数 反向传值 block 闭包
  BottomNavigationBarDemo({this.increaseCount});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState(increaseCount: this.increaseCount);
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  final int CurrentIndex = 0;
  final void Function(int index) increaseCount;
  _BottomNavigationBarDemoState({this.increaseCount});
  int _currentIndex = 0;
  List normalIcons = ['images/tabbar/Home@3x.png', 'images/tabbar/data@3x.png','images/tabbar/News@3x.png', 'images/tabbar/products@3x.png',];
  List selectIcons = ['images/tabbar/Home-Click@3x.png', 'images/tabbar/data-Click@3x.png','images/tabbar/News-Click@3x.png', 'images/tabbar/products-Click@3x.png'];
  List titles = ['Home', "Data", "News", "Me"];
  List arr = [0,1,2,3];


  void _onTapHandler(int index) {
    print('_onTapHandler');
    setState(() {
      _currentIndex = index;
    });
    this.increaseCount(index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      type: BottomNavigationBarType.fixed,
      // fixedColor: Color(0xff2121fb), //底部tabbar 选中的颜色
      selectedItemColor: Color(0xff3c80ed), //选中颜色
      unselectedItemColor: Color(0xffffffff), //未选中颜色
      backgroundColor: Color(0xff21212b),

    items: arr.map((index){
      return  BottomNavigationBarItem(
          icon: index == _currentIndex ? Image.asset(selectIcons[index],width: 20,height: 20,) : Image.asset(normalIcons[index],width: 20,height: 20,),
          title: Text(titles[index],style: TextStyle(
            fontSize: 11
          ),),
        );
    }).toList(),
    );
  }
}
