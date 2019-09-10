import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  final String url;
  WebView({
    this.url,
  });
  @override
  Widget build(BuildContext context) {
    print('url = ' + url);
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color(0xff21212b),
        ),
        body: Material(
          child: WebviewScaffold(
            url: this.url,
            withZoom: true,
// url: "http://www.baidu.com",
          ),
        ));
  }


}
