import 'package:flutter/material.dart';

class ExpansionPanelListDemoState extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}
class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemoState> {
  List<int> mList;//组成一个int类型数组，用来控制索引
  List<ExpandStateBean> expandStateList; //开展开的状态列表， ExpandStateBean是自定义的类

  //构造方法，调用这个类的时候自动执行
  _ExpansionPanelListDemoState() {
    mList = List();
    expandStateList = List();
    for(int i=0;i<10;i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  //设置展开收起
  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      expandStateList.forEach((item){
        if(item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion tile list demo'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (i,bol){
            _setCurrentIndex(i,bol);
          },
          children: mList.map((i){
            int num = i+1;
            return ExpansionPanel(
              headerBuilder: (context,isExpanded) {
                return ListTile(
                  title: Text('This is ==No.$num'),
                );
              },
              body: ListTile(
                title: Text('expansion no.$i'),
              ),
              isExpanded: expandStateList[i].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}

//构造方法
class ExpandStateBean{
  bool isOpen;
  int index;
  ExpandStateBean(this.index,this.isOpen);
}