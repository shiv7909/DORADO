

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../CONTROLLERS/Title_retriver_controller.dart';


class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key, required  this.title,
    required this.size,
  }):super(key: key);

  final String title;
  final double size;


  @override
  Widget build(BuildContext context) {


    final titleRetriever = Get.find<Title_retriever>();

    return FutureBuilder<String> (
        future: titleRetriever.fetchTitle(title),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                height: 20,
                margin: EdgeInsets.only(left: 15,right: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10 ))),
            );
          }
          else {
            return Container(
               padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(

                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15,bottom: 5,left: 10),
                      padding: const EdgeInsets.only(top: 3),
                      child: Text( snapshot.data!.toUpperCase() ,
                        style: TextStyle(fontSize: size, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Spacer(),
                    // TextButton(onPressed: () {},
                    //   child: Text('More➡️', style: TextStyle(fontSize: 13,color: Colors.black54),),)
                  ]
              ),
            );
          }
        }
    );
    }
  }

