import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';


class TwoCommunicate extends StatefulWidget {
  @override
  _TwoCommunicateState createState() => _TwoCommunicateState();
}

class _TwoCommunicateState extends State<TwoCommunicate> {

  String _nativeCallBackValue = '99';
  void test(){
    if(Platform.isIOS){
      _nativeCallBackValue = '前往OC页面ios';
    }else if(Platform.isAndroid){
     _nativeCallBackValue = '前往安卓页面';
    }
  }
  



  //交互的通道名称，flutter和native是通过这个标识符进行相互间的通信
  static const communicateChannel =
      MethodChannel('1234567890');

  //异步执行调用原生方法，保持页面不卡住，因为调用原生的方法可能没实现会抛出异常，所以trycatch包住
  Future<void> _communicateFunction(flutterPara) async {
      test();
    try {
      //原生方法名为callNativeMethond,flutterPara为flutter调用原生方法传入的参数，await等待方法执行
      final result = await communicateChannel.invokeMethod(
          'callNativeMethond', flutterPara);
      //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
      _nativeCallBackValue = result + "234";
    } on PlatformException catch (e) {
      //抛出异常
      //flutter: PlatformException(001, 进入异常处理, 进入flutter的trycatch方法的catch方法)
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                child: Text(_nativeCallBackValue),
                onPressed: () {
                  _communicateFunction('flutter传值');
                  setState(() {});
                },
              ),
              CupertinoButton(
                color: Colors.blue,
                child: Text("调用OC分享"),
                onPressed: () {
                  _communicateFunction('share');
                  setState(() {});
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
