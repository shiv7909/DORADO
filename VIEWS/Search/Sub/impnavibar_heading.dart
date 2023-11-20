import 'package:flutter/material.dart';

class impnavi_head extends StatefulWidget {
  @override
  State<impnavi_head> createState() => _impnavibar_head();
}

class _impnavibar_head extends State<impnavi_head> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
          // color: Color(0xFF1E272E),
        color:Colors.white,
       // color: Color(0xFF2C3A47),
        // Color(0xFF1E272E),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10, top: 5),
      height: 40,
      width: size.width,
      child: FittedBox(
        child: Text(
          'Explore ',
          style: TextStyle(
              // fontFamily: 'Gohan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }
}
