import 'dart:convert';
import 'package:beasiswa/ui/home.dart';
import 'package:beasiswa/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  bool _isLoading = false;

  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();


  Future loadJson() async {
    setState(() {
    _isLoading = true;
    });
    String baseUrl = "https://beasiswarest.000webhostapp.com/api/v1/user/signin";
    var response = await http.post(baseUrl, headers: {"Accept" : "application/json"}, body: {'email' : '${emailc.text}', 'password': '${passwordc.text}'});
    if (response.statusCode == 201) {
      setState(() {
      _isLoading = false;
      });

    final jsonData = json.decode(response.body);
    String token = jsonData['token'];
    print(token);


    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Home()
    ));

    }

    else {
      setState(() {
        print(response.statusCode);
        print(response.body);
       _isLoading = false;
        Toast.show("Email sudah Terdaftar", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/graduate.png'),
      ),
    );

   
    final email = TextFormField(
      controller: emailc,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordc,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          loadJson();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final nothaveaccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Not Have Account?'),
        FlatButton(
      child: Text(
        'Register',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Register()
        ));
      },
    )
      ],
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

  

     return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            _isLoading? CircularProgressIndicator() : loginButton,
            nothaveaccount,
            forgotLabel,
          ],
        ),
      ),
    );
  }
}