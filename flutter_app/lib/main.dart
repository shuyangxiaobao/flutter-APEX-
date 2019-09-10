import 'package:flutter/material.dart';
import 'entrance.dart';
import 'package:flutter_app/1.Home/home.dart';
import 'package:flutter_app/1.Home/home2.dart';
import '1.Home/login.dart';
import 'APEX/Home/apexHome.dart';
import 'APEX/Home/WebView.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Entrance(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink, //主题颜色
        highlightColor: Color(0x05000000), //按钮高亮颜色 （）
        splashColor: Color(0x05000000), //按钮点击时的颜色
        accentColor: Color(0x00000000),
      ),
      routes: {
        './home': (context) => Home(),
        './home2': (context) => Home2(),
        './login': (context) => LoginApex(),
        './webview': (context) => WebView(),
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
