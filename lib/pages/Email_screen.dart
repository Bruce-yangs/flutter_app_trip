import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email  Page'),
      ),
      backgroundColor: Colors.lightGreen,
      body: Center(
          child: Row(children: <Widget>[
        Text('Email  Page',
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700)),
        MaterialButton(
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pop();
            })
      ])),
    );
  }
}
