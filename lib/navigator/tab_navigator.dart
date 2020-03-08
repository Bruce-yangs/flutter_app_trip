import 'package:flutter/material.dart';
import 'package:flutterapptrip/pages_item/home_page.dart';
import 'package:flutterapptrip/pages_item/my_page.dart';
import 'package:flutterapptrip/pages_item/search_page.dart';
import 'package:flutterapptrip/pages_item/travel_page.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColr = Colors.grey;//定义默认颜色
  final _activeColr = Colors.blue;//定义选中颜色
  int _currentIndex = 0;//当前选中的下标
  final PageController _controller = PageController(
    initialPage: 0,//初始页面
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(//导入页面
        controller: _controller,
        children: <Widget>[//此处和底部按钮顺序要对应
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){//点击事件回调
            _controller.jumpToPage(index);//跳转到对应的下标页面
            setState(() {//同时同步当前的下标
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,//固定底部 同时显示文案和icon
          items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.home,color: _defaultColr),
          activeIcon: Icon( Icons.home,color: _activeColr),
          title: Text('首页',style: TextStyle(color: _currentIndex!=0?_defaultColr:_activeColr),)
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.search,color: _defaultColr),
            activeIcon: Icon( Icons.search,color: _activeColr),
            title: Text('搜索',style: TextStyle(color: _currentIndex!=1?_defaultColr:_activeColr),)
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.camera_alt,color: _defaultColr),
            activeIcon: Icon( Icons.camera_alt,color: _activeColr),
            title: Text('旅拍',style: TextStyle(color: _currentIndex!=2?_defaultColr:_activeColr),)
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.account_circle,color: _defaultColr),
            activeIcon: Icon( Icons.account_circle,color: _activeColr),
            title: Text('我的',style: TextStyle(color: _currentIndex!=3?_defaultColr:_activeColr),)
        )
      ]),
    );
  }
}