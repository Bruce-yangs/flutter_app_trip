import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  _wrapDemoState createState() => _wrapDemoState();
}

class _wrapDemoState extends State<WrapDemo> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(addButton());
  }
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽高
    final width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap demo 流式布局')
      ),
      body:Center(
        child: Opacity(
            opacity: .8,
            child: Container(
              width: width,
              height: height/2,
              color: Colors.grey,
              child: Wrap(
                children: list,
                spacing: 26.0,
              ),
            ),
        ),
      )
    );
  }
  Widget addButton() {
    return GestureDetector(
      onTap: (){
        if (list.length < 9) {
          //点击动态更改数据
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(child: Text('照片')),
      ),
    );
  }
}

