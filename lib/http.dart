import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class Http extends StatefulWidget {
  Http({Key key}) : super(key: key);

  @override
  _HttpState createState() =>  _HttpState();
}

class _HttpState extends State<Http> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient =  HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(height: 32.0);

    return  Scaffold(
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('Your current IP address is:'),
             Text('$_ipAddress.'),
            spacer,
             RaisedButton(
              onPressed: _getIPAddress,
              child:  Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}