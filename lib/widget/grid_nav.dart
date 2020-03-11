import 'package:flutter/material.dart';
import 'package:flutterapptrip/model/common_model.dart';
import 'package:flutterapptrip/model/grid_nav_model.dart';
import 'package:flutterapptrip/widget/webview.dart';

//网格卡片
class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;

  const GridNav({Key key,@required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              clipBehavior: Clip.antiAlias,
              child:Column(
                children: _gridNavItems(context),
            )
        );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context,gridNavModel.hotel,true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context,gridNavModel.flight,false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context,gridNavModel.travel,false));
    }
    return items;
  }

  //每个模块
  _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));
    List<Widget> exandItems = [];
    //循环给每个子级撑满
    items.forEach((item){
      exandItems.add(Expanded(child: item,flex:1));
    });
    //定义渐变开始和结束颜色
    Color startColor = Color(int.parse('0xff'+gridNavItem.startColor));
    Color endColor = Color(int.parse('0xff'+gridNavItem.endColor));
    return Container(
      height: 88,
      margin: first?null:EdgeInsets.only(top:3),
      decoration: BoxDecoration(
        //线性渐变
        gradient: LinearGradient(colors: [startColor,endColor])
      ),
      child: Row(//水平添加 每个子级
        children: exandItems,
      ),
    );
  }

  _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Image.network(
              model.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              padding: EdgeInsets.only(top: 11),
              child: Text(//文字在下覆盖上面图片
                model.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        model);
  }

  //上下布局
  _doubleItem(BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded( //Expanded 高度 撑开整个父布局元素
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        )
      ],
    );
  }

  //子级元素
  _item(BuildContext context, CommonModel item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      //水平方向展开
      widthFactor: 1, //宽度撑满父级布局
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: borderSide,
                bottom: first ? borderSide : BorderSide.none)),
        child: _wrapGesture(//调用 点击封装跳转方法
            context,
            Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            item),
      ),
    );
  }

  //封装公用跳转方法
  _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                    title: model.title,
                    url: model.url,
                    statusBarColor: model.statusBarColor,
                    hideAppBar: model.hideAppBar)));
      },
      child: widget
    );
  }
}
