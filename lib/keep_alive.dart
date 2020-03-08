import 'package:flutter/material.dart';

class keepAliveDemo extends StatefulWidget {
  @override
  _keepAliveDemoState createState() => _keepAliveDemoState();
}

class _keepAliveDemoState extends State<keepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('keep alive demo'),
        bottom: TabBar(
          //头部tab
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.delete_sweep)),
            Tab(icon: Icon(Icons.call_missed)),
            Tab(icon: Icon(Icons.gamepad)),
          ],
        ),
      ),
      body: TabBarView(
          //页面
          controller: _controller,
          children: <Widget>[
            MyPage(),
            MyPage(),
            MyPage(),
            MyPage()
          ]),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<MyPage> with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCount() {
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          //页面
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text('点一次增加一个数字'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display3,
            )
          ])),
      floatingActionButton: FloatingActionButton(//浮框
          onPressed: _incrementCount,
          tooltip: 'Increment',//长按提示
          child:Icon(Icons.add)//icon
      ),
    );
  }
}
