import 'package:flutter/material.dart';
import 'package:flutterapptrip/pages_item/home_page.dart';
import 'package:flutterapptrip/pages_item/my_page.dart';
import 'package:flutterapptrip/pages_item/search_page.dart';
import 'package:flutterapptrip/pages_item/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColr = Colors.grey; //定义默认颜色
  final _activeColr = Colors.blue; //定义选中颜色
  int _currentIndex = 0; //当前选中的下标
  final PageController _controller = PageController(
    initialPage: 0, //初始页面
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //导入页面
        controller: _controller,
        children: <Widget>[
          //此处和底部按钮顺序要对应
          HomePage(),
          SearchPage(hideLeft: true),
          TravelPage(),
          MyPage(),
        ],
        physics: NeverScrollableScrollPhysics(),//禁止pageView滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            //点击事件回调
            _controller.jumpToPage(index); //跳转到对应的下标页面
            setState(() {
              //同时同步当前的下标
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, //固定底部 同时显示文案和icon
          items: [
            _barItem(Icons.home, '首页', 0),
            _barItem(Icons.search, '搜索', 1),
            _barItem(Icons.camera_alt, '旅拍', 2),
            _barItem(Icons.account_circle, '我的', 3)
          ]),
    );
  }

  _barItem(IconData icon, String text, int idx) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColr),
        activeIcon: Icon(icon, color: _activeColr),
        title: Text(
          text,
          style: TextStyle(
              color: _currentIndex != idx ? _defaultColr : _activeColr),
        ));
  }
}
