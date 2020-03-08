import 'package:flutter/material.dart';
import 'Email_screen.dart';
import 'custom_router.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        elevation: 4.0,
      ),
      backgroundColor: Colors.blue,
      body: Center(
          child: Row(children: <Widget>[
        Text('Home Page',
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700)),
        MaterialButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
            onPressed: () {
              //自定义跳转
              Navigator.of(context).push(CustomRoute(Email()));

              /*Navigator.of(context) //普通跳转r
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Email();
              }));*/
            })
      ])),
    );
  }
}
