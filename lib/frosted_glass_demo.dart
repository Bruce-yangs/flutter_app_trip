import 'package:flutter/material.dart';
import 'dart:ui'; //图片过滤器必须引用

//制作底部导航 切换
class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title:Text(widget._title)),
        body: Stack(children: <Widget>[
      ConstrainedBox(
        //小部件 约束条件child上
        constraints: const BoxConstraints.expand(),
        child: Image.network(
            'https://i0.hdslb.com/bfs/archive/d8469038472a626a2f8442e9081e7e5e67c79682.jpg@336w_190h.webp'),
      ),
      Center(
        child: ClipRect(//可裁切
          child: BackdropFilter(//背景过滤器
              filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 2.0),
            child: Opacity(opacity: 0.5,child: Container(
              width: 500.0,
              height: 700.0,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(
                child:Text('xxx',style: Theme.of(context).textTheme.display3,)
              ),
            ),),
          ),
        ),
      )
    ]));
  }
}
