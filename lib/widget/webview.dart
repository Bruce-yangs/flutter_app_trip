import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//域名白名单
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  //定义相关参数
  String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  //构造方法
  /*const*/ WebView(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
        this.backForbid = false})
      : super(key: key){
     if (url != null && url.contains('ctrip.com')) {
       //fix 携程H5 http://无法打开问题
       url = url.replaceAll("http://", 'https://');
     }
   }

   @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  //创建实例
  final webviewReference = FlutterWebviewPlugin();

  //StreamSubscription  需要导入dart:async包
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  bool exiting = false;

  @override //重写initState方法
  void initState() {
    super.initState();
    webviewReference.close(); //防止页面重新打开
                                //监听url变化回调
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url) {
      //对非http获取https链接判断
      if (url == null || !url.startsWith('http')) {
        webviewReference.stopLoading();
      }
    });
    //监听页面导航状态变化
    _onStateChanged =
        webviewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          //是否包含相关url
          if(_isToMain(state.url) && !exiting) {//exiting 标记是否 返回过
            //如果禁止返回 重新加载当前页面
            if(widget.backForbid) {
              webviewReference.launch(widget.url);
            } else {
              //返回上一页 exiting标识不重复返回
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    //当网络不稳定
    webviewReference.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webviewReference.dispose();
    super.dispose();
  }
  //判断url是否是首页
  bool _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      //?.如果存在才走endsWith(value) 否则 走false
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }
  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[//Color(int.parse('0xff'+statusBarColorStr) //设计稿颜色
          _appBar(Color(int.parse('0xff'+statusBarColorStr)),backButtonColor),
          //Expanded 撑满整个界面
          Expanded(child: WebviewScaffold(url: widget.url,
            withZoom: true,//是否可缩放
            userAgent: 'null',//防止携程H5页面重定向到打开携程APP ctrip://wireless/xxx的网址
            withLocalStorage: true,//是否取用本地缓存
            hidden: true,//默认隐藏
            initialChild: Container(//初始化的界面 等待的页面
              color: Colors.white,
              child: Center(
                child: Text('Waiting...'),
              ),
            ),
          ),)
        ],
      ),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(//撑满整个屏幕宽度
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.close, color: backButtonColor, size: 26),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget.title ?? '',
                    style:TextStyle(color: backButtonColor,fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
