import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutterapptrip/model/home_model.dart';

const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';

//获取数据
class HomeDao {
  //吐出一个HomeModel类型数据 fetch只是方法名字
  static Future<HomeModel> fetch() async {
    Response response = await Dio().get(HOME_URL);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}


//如果用http做 请求如下
//import 'package:http/http.dart' as http ; //as http 相当于 起别名
//import 'dart:convert';//模型转换
//import 'dart:async';

/*class HomeDao {
  //吐出一个HomeModel类型数据 fetch只是方法名字
  static Future<HomeModel> fetch() async {
    Response response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();//解决中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}*/

