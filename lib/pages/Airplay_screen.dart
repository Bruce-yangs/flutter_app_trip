import 'package:flutter/material.dart';
class Airplay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Airplay   Page'),),
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('Airplay  Page',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w700),),
      ),
    );
  }
}