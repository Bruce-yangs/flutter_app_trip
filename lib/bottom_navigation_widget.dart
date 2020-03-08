import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/Email_screen.dart';
import 'pages/Airplay_screen.dart';

//制作底部导航 切换
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidget createState() => _BottomNavigationWidget();
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pageList = List();

  @override //重写initState
  void initState() {
    pageList //加入对应的页面 ..加入后并返回pageList
      ..add(Home())
      ..add(Email())
      ..add(Airplay());

    super.initState();//调用父类方法
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _BottomNavigationColor,
          ),
          title: Text(
            'Home',
            style: TextStyle(color: _BottomNavigationColor),
          )
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Email',
              style: TextStyle(color: _BottomNavigationColor),
            )
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Airplay',
              style: TextStyle(color: _BottomNavigationColor),
            )
        )
      ],
      onTap: (int index){ //加入点击事件
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex, //底部导航索引 对应高亮
      ),
    );
  }
}