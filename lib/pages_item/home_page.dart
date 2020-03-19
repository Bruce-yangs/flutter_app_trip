import 'package:flutter/material.dart';
import 'package:flutterapptrip/dao/home_dao.dart';
import 'package:flutterapptrip/model/common_model.dart';
import 'package:flutterapptrip/model/grid_nav_model.dart';
import 'package:flutterapptrip/model/home_model.dart';
import 'package:flutterapptrip/model/sales_box_model.dart';
import 'package:flutterapptrip/pages_item/search_page.dart';
import 'package:flutterapptrip/pages_item/speak_page.dart';
import 'package:flutterapptrip/widget/grid_nav.dart';
import 'package:flutterapptrip/widget/loading_container.dart';
import 'package:flutterapptrip/widget/local_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapptrip/widget/sales_box.dart';
import 'package:flutterapptrip/widget/search_bar.dart';
import 'package:flutterapptrip/widget/sub_nav.dart';
import 'package:flutterapptrip/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(
    initialPage: 0, //初始页面
  );

  /*List _imageUrl = [
    'https://dimg04.c-ctrip.com/images/zg0p1d000001eno3o7583.jpg',
    'https://dimg04.c-ctrip.com/images/zg0u1c000001e40okDCDB.jpg',
  ];*/
  double appBarAlpha = 0;

  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
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
  Future<Null> _handleRefresh() async {
    //方法一
    /*HomeDao.fetch().then((result){
      setState((){
        resultString = json.encode(result);
      });
    }).catchError((e){
      resultString = e.toString();
    });*/

    /*方法二*/
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
            isLoading: _loading,
            child: Stack(
              children: <Widget>[
                MediaQuery.removePadding(
                    removeTop: true, //移除顶部的padding
                    context: context,
                    child: RefreshIndicator(
                        child: NotificationListener(
                          //监听滚动
                          onNotification: (scrollNotification) {
                            //当满足是ScrollUpdateNotification才触发
                            if (scrollNotification
                                    is ScrollUpdateNotification &&
                                scrollNotification.depth == 0) {
                              //scrollNotification.depth 找到 ListView滚动才触发
                              //滚动且是列表滚动的时候
                              _onScroll(scrollNotification.metrics.pixels);
                            }
                          },
                          child: _listView,
                        ),
                        onRefresh: _handleRefresh)),
                _appBar
              ],
            )));
  }

  //抽离列表
  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(localNavList: localNavList),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: //GridNav 自定义组件
                GridNav(gridNavModel: gridNavModel)),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: //GridNav 自定义组件
                SubNav(subNavList: subNavList)),
        Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: //GridNav 自定义组件
                SalesBox(salesBox: salesBoxModel)),
        /*Container(
          height: 800,
          child: ListTile(title: Text('localNavList')),
        )*/
      ],
    );
  }

  //抽离appBar
  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              //AppBar渐变遮罩背景
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
                color:
                    Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        )
      ],
    );
    /*Opacity(
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
    );*/
  }

  //抽离banner
  Widget get _banner {
    return Container(
        height: 240,
        child: Swiper(
          itemCount: bannerList.length,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  CommonModel model = bannerList[index];
                  return WebView(
                      url: model.url,
                      title: model.title,
                      hideAppBar: model.hideAppBar);
                }));
              },
              child: Image.network(
                bannerList[index].icon,
                fit: BoxFit.fill, //图片的适配方式
              ),
            );
          },
          pagination: SwiperPagination(), //指示器
        ));
  }

  //跳转到搜索页
  _jumpToSearch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(hint: SEARCH_BAR_DEFAULT_TEXT)));
  }

  //跳转到语音页
  _jumpToSpeak() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SpeakPage()));
  }
}
