import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutterapptrip/model/search_model.dart';

const SEARCH_URL = 'https://m.ctrip.com/restapi/h5api/globalsearch/search?userid=M2208559994&source=mobileweb&action=mobileweb&keyword=';

///搜索接口
class SearchDao {
  static Future<SearchModel> fetch(String keyword) async {
    Response response = await Dio().get(SEARCH_URL + keyword);
    if (response.statusCode == 200) {
      //只有当输入的内容与服务端返回的内容一致时才渲染
      SearchModel model = SearchModel.fromJson(response.data);
      model.keyword = keyword;
      return model;
    } else {
      throw Exception('Failed to load search');
    }
  }
}