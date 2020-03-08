import 'package:flutter/material.dart';

List<String> CITY_NAMES = ['北京','上海','广州','深圳','杭州','成都','郑州','武汉'];

class GridViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView.count(
        crossAxisCount:1,//一行显示多少列
        children: _buildList(),
      )
    );
  }
  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(6)),
      child: Text(
        city,
        style: TextStyle(color: Colors.white,fontSize: 22),
      ),
    );
  }
}