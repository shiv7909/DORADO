

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/VIEWS/HOME.dart';


class HEADER extends StatelessWidget {

  HEADER({
    required this.headername,});

  final String headername;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
       margin: EdgeInsets.only(left:10,right: 10,top: 10),
        height: size.height*0.1,
           child: Column(
             children: [
               Stack(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 20,left: 10),
                    //  margin: EdgeInsets.all((size.height/80)),
                   // padding: EdgeInsets.only(left: (size.width/2)-80),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.le,
                        children: <Widget>[
                            Text(headername,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black,
                                fontWeight: FontWeight.w100, fontSize: 15,fontFamily: 'RobotoCondensed',
                              ),),
                        ],
                      )
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                      child: Stack(
                        children:
                        [
                         OutlinedButton(onPressed: (){
                          Get.to(()=>HomeScreen());
                         },
                            child: Text('Filter ')),
                          Positioned(
                            right: 10,
                              bottom: 18,
                              child: FaIcon(FontAwesomeIcons.list,size: 10,color: Colors.blue,)),
                               ]   ))
                ]
               ),
               Container(
                 margin: EdgeInsets.only(left: 6,right: 6,top: 9),
                 decoration: BoxDecoration(
                   color: Colors.black54,
                   borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                 height: 1,),

             ],
           ),

    );
  }
}

