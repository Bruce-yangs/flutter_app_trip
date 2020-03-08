import 'package:flutter/material.dart';
//import 'pages/home_screen.dart';
//import 'pages/Email_screen.dart';
//import 'pages/Airplay_screen.dart';

//制作底部导航 切换
class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
/*  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pageList = List();

  @override //重写initState
  void initState() {
    pageList //加入对应的页面 ..加入后并返回pageList
      ..add(Home())
      ..add(Email())
      ..add(Airplay());

    super.initState();//调用父类方法
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget._title)),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}