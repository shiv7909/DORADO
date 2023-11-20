import 'package:flutter/material.dart';
import 'package:untitled1/VIEWS/HOME.dart';
import 'package:untitled1/VIEWS/Home/drawer/sidescreen.dart';

class DRAWER extends StatefulWidget {

  @override
  State<DRAWER> createState() => drawer();
}

class drawer extends State<DRAWER>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: <Widget>[
        HomeScreen(),
        SideScreen(),
      ],
      )
    );
  }
}



