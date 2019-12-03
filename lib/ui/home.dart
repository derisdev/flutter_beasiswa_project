import 'package:beasiswa/ui/navbar/beasiswa.dart';
import 'package:beasiswa/ui/navbar/profile.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  
  final pages = [
    Beasiswa(),
    Profile()
  ];

  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beasiswa'), 
        centerTitle: true,       
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            title: Text('Beasiswa')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
          ),
        ],
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,        
        onTap: onTap,
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
