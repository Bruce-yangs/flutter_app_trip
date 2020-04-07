import 'package:flutter/material.dart';

//import 'package:flutterapptrip/refresh_loadMore.dart';//上拉加载 下拉刷新

import 'navigator/tab_navigator.dart';//项目页面切换

//import 'grid_view.dart';//grid
//import 'http.dart';//http
//import 'navigator/tab_navigator.dart';//项目
//import 'expansion_tile_list.dart';//列表展开收起

//import 'expansion_tile.dart';//展开收起

//import 'wrap_demo.dart';//wrap 布局
//import 'input_demo.dart';//搜索
//import 'keep_alive.dart';//切换导航

//import 'stateful_widget_demo.dart';//收藏列表

//import 'frosted_glass_demo.dart';//高斯模糊
//import 'bottom_navigation_widget.dart';
//import 'bottom_appBar_demo.dart';








void main() => runApp(MyApp());

//不规则底部工具栏
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter bottomNavigationBar diff',
//        theme:  ThemeData.dark(),

//        theme: ThemeData.light(),
        /*theme: new ThemeData(//或者这种形式
          primaryColor: Colors.white,
        ),*/
        home:TabNavigator()//项目


//          home:TabNavigator()//上下拉交互
//          home:RefreshAndMore()//上下拉交互

//        home:GridViewList()//Grid
//        home:Http()//http
//        home:ExpansionPanelListDemoState()//布局
//        home:WrapDemo()//wrap布局
//        home:SearchBarDemo()//搜索
//        home:FrostedGlassDemo()//高斯模糊
//        home:BottomNavigationWidget()//底部导航
//        home:BottomAppBarDemo()//底部导航 圆形新增
    );
  }
}


//底部导航功能
/*class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),
      home:BottomNavigationWidget()//底部导航
    );
  }
}*/




//导航参数传递和接受===========start================
/*class Product {
  final String title; //商品标题
  final String description; //商品描述
  Product(this.title, this.description);
}

void main() => *//*{*//*
    runApp(MaterialApp(
        title: '导航参数传递和接受',
        home: ProductList(
            products:
                List.generate(20, (i) => Product('商品 $i', '详情id==为 $i')))));
// }

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: ListView.builder(
        //physics: AlwaysScrollableScrollPhysics(),////设置physics属性总是可滚动
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(products[index].title),
                onTap: () {
                  //内部方法 跳转传参
                  _getDesc(context, index);

//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) =>
//                          new ProductDetail(product: products[index])));
                },
              ),
              Divider()
            ],
          );
        },
        itemCount: products.length,
      ),
    );
  }

  _getDesc(BuildContext context, index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => ProductDetail(product: products[index])));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

//商品详情页
class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${product.title}')),
        //加入图片
        *//*body: Image.asset('images/b.jpg')*//*
        body: Column(
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.pop(context, '${product.description}');
                },
                child: Text('${product.description}')),
            Image.asset('images/b.jpg')
          ],
        ));
  }
}

*/
//=====================end=========================


//导航父子页面跳转返回
/*void main() => runApp(MaterialApp(
  title: '导航',
  home: new FirstScreen(),
));

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('导航页面')),
      body:Center(
        child: RaisedButton(
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
            new SecondScreen()
          ));
        },
        child: Text('查看商品详情页'),
        ),
      )
    );
  }
}
//第二个页面
class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二个页面')),
      body:Center(
        child: RaisedButton(onPressed: (){
          //返回上一页
          Navigator.pop(context);
        },
        child: Text('返回上一页'),
        ),
      )
    );
  }
}*/

//card布局
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(
        child: Column(children: <Widget>[
      ListTile(
          title: Text('河南省济源市',style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text('有家乡的特色，还有美食'), //subtitle 小标题
          leading: new Icon(Icons.account_circle, color: Colors.lightBlue)),
      new Divider(),
      ListTile(
          title: Text('北京市',style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text('年轻人奋斗向往的地方'), //subtitle 小标题
          leading: new Icon(Icons.account_circle, color: Colors.lightGreen)),
      new Divider(),
      ListTile(
          title: Text('上海市',style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text('开放的生态社区，还有美食'), //subtitle 小标题
          leading: new Icon(Icons.account_circle, color: Colors.purple)),
      new Divider()

        ]));
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(title: new Text('card布局')),
        body: Center(
          child: card,
        ),
      ),
    );
  }
}*/

//positioned 层叠定位
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var pos = new Positioned(//层叠定位
        top: -30.0,
        left: 50.0,
        child: new Text('flutter', style: TextStyle(fontSize: 43.4,color: Colors.red)));

    var stack = new Stack(
      alignment: const FractionalOffset(.5, .8),//相对父容器调整x,y
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg'),
          radius: 100.0
        ),
        new Container(//div
          decoration: new BoxDecoration(
            color: Colors.limeAccent,
          ),
          padding: EdgeInsets.all(5.0),
          child: new Text('最亮的仔',style: TextStyle(fontSize: 30,color: Colors.lightBlue)),//内容文本
        ),
        pos
      ],
    );

    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: new AppBar(
              title:new Text('stack层叠布局')
          ),
          body: Center(
            child: stack,
          ),
        )
    );
  }
}*/

//stack层叠布局
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const FractionalOffset(.5, .8),
      children: <Widget>[
        new CircleAvatar(//头像
          backgroundImage: new NetworkImage('http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg'),
          radius: 100.0,
        ),
        new Container(//div
          decoration: new BoxDecoration(
            color: Colors.limeAccent,
          ),
          padding: EdgeInsets.all(5.0),
          child: new Text('最亮的仔',style: TextStyle(fontSize: 30,color: Colors.lightBlue)),//内容文本
        )
      ],
    );
    // TODO: implement build
    return MaterialApp(
      title: 'stack demo',
      home: Scaffold(
        appBar: new AppBar(
          title:new Text('stack层叠布局')
        ),
        body: Center(
          child: stack,
        ),
      ),
    );
  }
}*/

//垂直布局
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Col Widget Demo',
      home: Scaffold(
        appBar: new AppBar(title: new Text('垂直布局')),
        body: Center(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new Text('Col Widget'),
          Expanded(child:new Text('Widget Widget')),
          new Text('WidgetWidget Widget'),
          new Text('ColCol Widget')
        ])),
      ),
    );
  }
}*/

//横向布局
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title:'Row Widget Demo',
//       home: Scaffold(
//         appBar:new AppBar(
//           title: new Text('水平方向布局'),
//         ),
//         body: new Row(
//           children: <Widget>[//Expanded 平均等分
//             Expanded(child:new RaisedButton(onPressed: (){},color:Colors.redAccent,child:new Text('great button'))),
//             Expanded(child:new RaisedButton(onPressed: (){},color:Colors.tealAccent,child:new Text('great button'))),
//             Expanded(child:new RaisedButton(onPressed: (){},color:Colors.yellowAccent,child:new Text('great button'))),

//             // new RaisedButton(onPressed: (){},color:Colors.redAccent,child:new Text('great button')),
//             // new RaisedButton(onPressed: (){},color:Colors.tealAccent,child:new Text('great button')),
//             // new RaisedButton(onPressed: (){},color:Colors.yellowAccent,child:new Text('great button')),
//           ],
//         ),
//       ),
//     );
//   }
// }

//动态网格
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         appBar:new AppBar(title:new Text('Widget Grid')),
//         body: GridView.count(
//           padding: const EdgeInsets.all(10.0),
//           crossAxisSpacing: 10.0,//格子与格子之间的距离
//           crossAxisCount: 3,//每行显示多少
//           childAspectRatio: .7,//横竖比例 childAspectRatio:宽高比，这个值的意思是宽是高的多少倍，如果宽是高的2倍，那我们就写2.0，如果高是宽的2倍，我们就写0.5
//           mainAxisSpacing: 3.0,//每行间隙
//           children: <Widget>[
//             new Image.network('http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',fit: BoxFit.cover),new Image.network('http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',fit: BoxFit.cover),
//              new Image.network('http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',fit: BoxFit.cover),

//             ],
//           )
//         ),
//       );
//   }
// }

//动态列表数据
// void main() => runApp(MyApp(
//   items: new List<String>.generate(100, (i) => 'Item $i')
// ));

// class MyApp extends StatelessWidget{
//   final List<String> items;
//   MyApp({Key key,@required this.items}):super(key:key);//super 接受父类
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'demo',
//       home: Scaffold(
//       appBar: new AppBar(title:new Text('listView Widget')),
//         body: new ListView.builder(//动态
//           itemCount: items.length,
//           itemBuilder: (context,index){
//             return new ListTile(
//               title:new Text('${items[index]}')
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//列表及字体颜色
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'first flutter demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutters'),
//         ),
//         // body: Center(
//         //   child: Container(
//         //     child: Text(
//         //       'first flutter App ',
//         //       style: TextStyle(fontSize: 30),
//         //     ),
//         //     alignment: Alignment.topLeft,
//         //     width: 600.0,
//         //     height: 400.0,
//         //     // color: Colors.lightBlue,  //与渐变色冲突
//         //     padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
//         //     margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//         //     decoration: BoxDecoration(
//         //       //     gradient: const LinearGradient(colors: [
//         //       //   Colors.lightBlue,
//         //       //   Colors.greenAccent,
//         //       //   Colors.purple
//         //       // ]
//         //       // )
//         //       border:  Border.all(width: 1.0, color: Colors.red[600]),
//         //       borderRadius:  BorderRadius.all( Radius.circular(20.0)),
//         //       image:  DecorationImage(
//         //         image:  NetworkImage(
//         //             'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
//         //         centerSlice:  Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//         //       ),
//         //     ),
//         //   ),
//         // ),

//         body: ListView(
//           children: <Widget>[
//             Image(
//               width: 300,
//               height: 400,
//               repeat: ImageRepeat.noRepeat,
//               image: NetworkImage(
//                   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
//             ),
//             ListTile(
//               leading: Icon(Icons.ac_unit),
//               title: Text(
//                 'ac_unit', style: TextStyle(fontSize: 30),
//                 // border:Border.
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.access_alarms),
//               title: Text(
//                 'access_alarms', style: TextStyle(fontSize: 30),
//                 // border:Border.
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//组件
// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         new Container(
//           width:180.0,
//           color:Colors.purple
//         ),new Container(
//           width:180.0,
//           color:Colors.lightBlue
//         ),new Container(
//           width:180.0,
//           color:Colors.amber
//         ),new Container(
//           width:180.0,
//           color:Colors.deepOrange
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page1'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
