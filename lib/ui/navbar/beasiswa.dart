import 'dart:convert';
import 'package:beasiswa/ui/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Beasiswa extends StatefulWidget {
  @override
  _BeasiswaState createState() => _BeasiswaState();
}

class _BeasiswaState extends State<Beasiswa> {

  bool _isLoading = false;
  List dataBeasiswa;


  @override
  void initState() { 
    super.initState();
    getData();
  }
  
  Future getData() async {
    setState(() {
    _isLoading = true;
    });
    String baseUrl = "https://beasiswarest.000webhostapp.com/api/v1/beasiswa";
    var response = await http.get(baseUrl, headers: {"Accept" : "application/json"});
    if (response.statusCode == 200) {
      setState(() {
      _isLoading = false;
      final data = json.decode(response.body);
      dataBeasiswa = data['beasiswa'];
      });
    }

    else {
        print(response.statusCode);
        print(response.body);
      setState(() {
      
       _isLoading = false;
        Toast.show("Gagal Mengambil data", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading? Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
        itemCount: dataBeasiswa == null? 0 : dataBeasiswa.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
            child: Column(
              children: <Widget>[
                Text(dataBeasiswa[index]['title']),
                Divider(),
                Text(dataBeasiswa[index]['description']),
                Divider(),
                Text(dataBeasiswa[index]['time'])
              ],
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Detail(dataBeasiswa[index]['title'])
            ));
          },
          );
        },
      ),
    );
  }
}