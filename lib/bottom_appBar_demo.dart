import 'package:flutter/material.dart';
import 'each_view.dart';

//制作底部导航 切换
class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemo createState() => _BottomAppBarDemo();
}

class _BottomAppBarDemo extends State<BottomAppBarDemo> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pageList = List();

  @override //重写initState
  void initState() {
    pageList //加入对应的页面 ..加入后并返回pageList
      ..add(EachView('Home'))
      ..add(EachView('Airplay'));

    super.initState(); //调用父类方法
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EachView('New page');
          }));
          print('1111');
        },
        tooltip: '提示文字', //只有长安是时出现
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //centerDocked  centerFloat
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(), //在矩形两侧有个缺口
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex=0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex=1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
