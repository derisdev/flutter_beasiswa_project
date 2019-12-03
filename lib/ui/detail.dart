import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Detail extends StatefulWidget {

final String title;

Detail(this.title);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {


 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: Text('desc'),
            ),
            Card(
              child: Text('time'),
            ),
            RaisedButton(
              child: Text('Register'),
              onPressed: (){},
            )
          ],
        ),
      )
    );
  }
}