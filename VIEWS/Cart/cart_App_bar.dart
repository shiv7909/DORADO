
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../HOME.dart';


class cart_icon_head extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return Material(
      elevation: 3,
      color: Color(0XFFCCEAE6),
      child: Container(
       margin: EdgeInsets.only(top: 3),
        color: Color(0XFFCCEAE6),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: size.height*0.1,
                  width: size.width*0.1,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 17,
                      weight: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Text(
                          'Shopping Bag',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),
                        ),
                        SizedBox(width: 2,),
                        Icon(Icons.shopping_bag,size: 18,)
                        
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  width: size.width*0.1,
                ),
              ],
            ),


          ],
        ),
      ),

    );
  }
}
