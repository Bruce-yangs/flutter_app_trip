import 'package:flutter/material.dart';
import 'package:flutterapptrip/widget/webview.dart';

const String MY_URL = 'https://m.ctrip.com/webapp/myctrip/';
class MyPage extends StatefulWidget{
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>/*with AutomaticKeepAliveClientMixin*/ {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebView(
          url: MY_URL,
          hideAppBar: true,
//          backForbid: true,//返回禁止
          statusBarColor: '4c5bca',
        ),
      ),
    );
  }
 /* @override
  bool get wantKeepAlive => true;*/
}