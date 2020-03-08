//首页网格开炮模型
import 'common_model.dart';

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  //构造方法
  GridNavModel({this.hotel,this.flight,this.travel}); //{}包裹 可选

  //工厂方法
  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return json!=null? GridNavModel(
        hotel: GridNavItem.fromJson(json['hotel']),//酒店
        flight: GridNavItem.fromJson(json['flight']),//机票
        travel: GridNavItem.fromJson(json['travel'])) : null;//火车票

  }
}

class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem({this.startColor, this.endColor, this.mainItem, this.item1, this.item2, this.item3, this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
        startColor: json['startColor'],
        endColor: json['endColor'],
        mainItem: CommonModel.fromJson(json['mainItem']),
        item1: CommonModel.fromJson(json['item1']),
        item2: CommonModel.fromJson(json['item2']),
        item3: CommonModel.fromJson(json['item3']),
        item4: CommonModel.fromJson(json['item4']));
  }
}
