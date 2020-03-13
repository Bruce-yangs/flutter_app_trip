import 'package:flutter/material.dart';
import 'package:flutterapptrip/dao/home_dao.dart';
import 'package:flutterapptrip/model/common_model.dart';
import 'package:flutterapptrip/model/grid_nav_model.dart';
import 'package:flutterapptrip/model/home_model.dart';
import 'package:flutterapptrip/model/sales_box_model.dart';
import 'package:flutterapptrip/widget/grid_nav.dart';
import 'package:flutterapptrip/widget/local_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapptrip/widget/sales_box.dart';
import 'package:flutterapptrip/widget/sub_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(
    initialPage: 0, //初始页面
  );
  List _imageUrl = [
    'https://dimg04.c-ctrip.com/images/zg0p1d000001eno3o7583.jpg',
    'https://dimg04.c-ctrip.com/images/zg0u1c000001e40okDCDB.jpg',
  ];
  double appBarAlpha = 0;

  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  //滚动改变透明度
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  //调用接口
  loadData() async{
    //方法一
    /*HomeDao.fetch().then((result){
      setState((){
        resultString = json.encode(result);
      });
    }).catchError((e){
      resultString = e.toString();
    });*/

    /*方法二*/
    try{
      HomeModel model = await HomeDao.fetch();
      setState((){
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        salesBoxModel = model.salesBox;
      });
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfff2f2f2),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true, //移除顶部的padding
              context: context,
              child: NotificationListener(
                //监听滚动
                onNotification: (scrollNotification) {
                  //当满足是ScrollUpdateNotification才触发
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //scrollNotification.depth 找到 ListView滚动才触发
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                        height: 240,
                        child: Swiper(
                          itemCount: _imageUrl.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              _imageUrl[index],
                              fit: BoxFit.fill, //图片的适配方式
                            );
                          },
                          pagination: SwiperPagination(), //指示器
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: LocalNav(
                            localNavList:localNavList
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: //GridNav 自定义组件
                        GridNav(gridNavModel:gridNavModel)
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: //GridNav 自定义组件
                        SubNav(subNavList:subNavList)
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: //GridNav 自定义组件
                        SalesBox(salesBox:salesBoxModel)
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text('localNavList')),
                    )
                  ],
                ),
              )),
          Opacity(
            //添加透明度AppBar
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
