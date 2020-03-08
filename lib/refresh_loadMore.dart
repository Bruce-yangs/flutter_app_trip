import 'package:flutter/material.dart';


class RefreshAndMore extends StatefulWidget {
  @override
  _RefreshAndMoreState createState() => _RefreshAndMoreState();
}

class _RefreshAndMoreState extends State<RefreshAndMore> {
  List<String> cityNames = ['北京', '上海', '广州', '深圳', '杭州', '成都', '郑州', '武汉'];

  //列表都有一个 ScrollController
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {//生命周期开始
    _scrollController.addListener((){
      //滚动位置如果等于 最大滚动位置
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {//生命周期结束 移除 addListener 提高性能，减少损耗
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('下拉刷新  上拉加载更多')),
        body: RefreshIndicator(
            child: GridView.count(
              crossAxisCount: 1, //一行显示多少列
              children: _buildList(),
              controller: _scrollController,//务必加入触发
            ),
            onRefresh: _handleRefresh
        ));
  }
  _loadData() async{
    await Future.delayed(Duration(milliseconds:200));
    setState((){
      //List<String>.from() 复制数组
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
      print(list);
    });
  }

  Future<Null> _handleRefresh() async{ //onRefresh 要求必须返回 带有Future
    await Future.delayed(Duration(seconds: 2));//模拟数据请求 延迟2s
     setState((){
       cityNames = cityNames.reversed.toList();
     });
   return null;
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(6)),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
