import 'package:flutter/material.dart';
import 'package:flutterapptrip/dao/travel_tab_dao.dart';
import 'package:flutterapptrip/model/travel_tab_model.dart';
import 'package:flutterapptrip/pages_item/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    //初始化_controller
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then((TravelTabModel model) {

      _controller = TabController(length: model.tabs.length, vsync: this);//重新初始化 修复请求数据后空白问题

      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    //避免内存泄漏，影响性能问题
    _controller.dispose();
    super.dispose();
  }

//切换tabs
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: TabBar(
              controller: _controller,
              isScrollable: true,//开启左右滑动
              labelColor: Colors.black,
              labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
              indicator: UnderlineTabIndicator(//指示器
                  borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
                  insets: EdgeInsets.only(bottom: 10)),
              tabs: tabs.map<Tab>((TravelTab tab) {
                return Tab(//标题名称
                  text: tab.labelName,
                );
              }).toList(),
            ),
          ),
          Flexible(//水平方向撑开高度
              child: TabBarView(//TabBarView配合  TabBar 一起做交互
            controller: _controller,
            children: tabs.map((TravelTab tab) {
              return TravelTabPage(
                  travelUrl: travelTabModel.url,
                  groupChannelCode: tab.groupChannelCode);
            }).toList(),
          ))
        ],
      ),
    );
  }
}
