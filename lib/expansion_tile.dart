import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion tile demo'),
      ),
      body: Center(
        child: ExpansionTile(
          title:Text('Expansion tile'),
          leading:Icon(Icons.ac_unit),
          backgroundColor:Colors.white12,
          initiallyExpanded: true,
          children:<Widget>[
            ListTile(
              title: Text('list tile',style: TextStyle(color: Colors.lightBlue),),
              subtitle: Text('I am subtitle.'),
            ),
            ListTile(
              title: Text('list tile'),
              subtitle: Text('I am subtitle.'),
            )
          ]
        ),
      ),
    );
  }
}

