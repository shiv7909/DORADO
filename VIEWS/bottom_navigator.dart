//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:untitled1/VIEWS/HOME.dart';
// import '../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
// import 'AR/ar.dart';
//
// class bottom_navigator extends StatefulWidget {
//
//   final String selectedRoute; // Add a field to store the selected route
//
//   bottom_navigator({
//     required this.selectedRoute,
//   });
//
//   @override
//   State<bottom_navigator> createState() => _bottom_navigatorState();
// }
//
// class _bottom_navigatorState extends State<bottom_navigator> {
//
//   void _navigateTo(String routeName) {
//     if (Get.previousRoute == routeName) {
//       Get.until(ModalRoute.withName(routeName));
//     } else {
//       if (Get.previousRoute == '/navigated_home_1') {
//         removeARScreen = true;
//         Get.offAllNamed(routeName);
//       } else {
//         Get.toNamed(routeName);
//       }
//     }
//   }
//
//   bool isSelected(String routeName) {
//     return widget.selectedRoute == routeName;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: 54,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -10),
//             blurRadius: 30,
//             color: Colors.grey.withOpacity(0.25),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Get.toNamed('/home');
//                 _navigateTo('/home');
//               },
//               child: Icon(
//                 Icons.home,
//                 color: isSelected('/home') ? Colors.black:Colors.blueGrey
//               ),
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.white,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//
//
//           Expanded(
//             flex: 1,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Get.toNamed('/navigated_home_0');
//                 _navigateTo('/navigated_home_0');
//               },
//               child: Icon(
//                 Icons.search,
//                 color: isSelected('/navigated_home_0') ?Colors.black:Colors.blueGrey,
//               ),
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.white,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//
//
//
//           Expanded(
//             flex: 1,
//             child: ElevatedButton(
//               onPressed: () async {
//                 PermissionStatus status = await Permission.camera.status;
//                 if (status.isGranted) {
//                   // Get.toNamed('/navigated_home_1');
//
//                   _navigateTo('/navigated_home_1');
//                 } else {
//                   Permission.camera.request();
//                   print('Permission not given');
//                 }
//               },
//               child:  Text('AR',style:TextStyle(color: Colors.blueGrey,)),
//               // Image.asset(
//               //   'assists/images/Screenshot 2023-09-07 164551.png',
//               //   height: size.height,
//               //   width: 60,color: Colors.blueGrey,
//               // ),
//               style: ElevatedButton.styleFrom(
//                 elevation: 1,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.white,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//
//
//
//           Expanded(
//             flex: 1,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Get.toNamed('/navigated_home_2');
//                 _navigateTo('/navigated_home_2');
//                 // setState(() {
//                 //   final cartcontroller = Get.find<Cart_product_controller>();
//                 //   cartcontroller.getProductsFromCart();
//                 // });
//               },
//
//             // child:(CartEmpty.isTrue)?
//              child: Badge(
//                 child: Icon(
//                   Icons.shopping_bag,
//                   color: isSelected('/navigated_home_2') ?Colors.black:Colors.blueGrey,
//                 ),
//               ),
//           //         :   Icon(
//           //   Icons.shopping_bag,
//           //     color: isSelected('/navigated_home_2') ?Colors.black:Colors.blueGrey,
//           // ),
//
//
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.white,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//
//
//           // Expanded(
//           //   flex: 1,
//           //   child: ElevatedButton(
//           //     onPressed: () {
//           //       _navigateTo('/navigated_home_2');
//           //     },
//           //     style: ElevatedButton.styleFrom(
//           //       elevation: 0,
//           //       backgroundColor: Colors.white,
//           //       foregroundColor: Colors.white,
//           //       shape: StadiumBorder(),
//           //     ),
//           //     child: Stack(
//           //       alignment: Alignment.center,
//           //       children: [
//           //         Badge(
//           //           child: Icon(
//           //             Icons.shopping_bag,
//           //             color: isSelected('/navigated_home_2') ? Colors.black : Colors.blueGrey,
//           //           ),
//           //         ),
//           //         Positioned(
//           //           right: 0,
//           //           top: 0,
//           //           child: Container(
//           //             padding: EdgeInsets.all(2),
//           //             decoration: BoxDecoration(
//           //               color: Colors.red, // Background color of the badge
//           //               shape: BoxShape.circle,
//           //             ),
//           //             child: Text(
//           //               '5', // Your badge text here
//           //               style: TextStyle(
//           //                 color: Colors.white, // Text color
//           //                 fontSize: 12, // Font size
//           //                 fontWeight: FontWeight.bold,
//           //               ),
//           //             ),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//
//
//
//           Expanded(
//             flex: 1,
//             child: ElevatedButton(
//               onPressed: () {
//                 _navigateTo('/navigated_home_3');
//               },
//               child: Icon(
//                 Icons.account_circle_rounded,
//                 color: isSelected('/navigated_home_3') ? Colors.black:Colors.blueGrey,
//               ),
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.white,
//                 shape: StadiumBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'AR/ar.dart'; // Import Get package if not already done

class bottom_navigator extends StatefulWidget {
  final String selectedRoute; // Add a field to store the selected route

  bottom_navigator({
    required this.selectedRoute,
  });

  @override
  State<bottom_navigator> createState() => _bottom_navigatorState();
}

class _bottom_navigatorState extends State<bottom_navigator> {
  void _navigateTo(String routeName) {
    if (Get.previousRoute == routeName) {
      Get.until(ModalRoute.withName(routeName));
    } else {
      if (Get.previousRoute == '/navigated_home_1') {
        removeARScreen = true;
        Get.offAllNamed(routeName);
      } else {
        Get.toNamed(routeName);
      }
    }
  }

  bool isSelected(String routeName) {
    return widget.selectedRoute == routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 30,
            color: Colors.grey.withOpacity(0.25),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                _navigateTo('/home');
              },
              child: Icon(
                Icons.home,
                color: isSelected('/home') ? Colors.black : Colors.blueGrey,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),
          // Repeat the pattern for other buttons...



          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                // Get.toNamed('/navigated_home_0');
                _navigateTo('/navigated_home_0');
              },
              child: Icon(
                Icons.search,
                color: isSelected('/navigated_home_0') ?Colors.black:Colors.blueGrey,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),



          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () async {
                PermissionStatus status = await Permission.camera.status;
                if (status.isGranted) {
                  // Get.toNamed('/navigated_home_1');

                  _navigateTo('/navigated_home_1');
                } else {
                  Permission.camera.request();
                  print('Permission not given');
                }
              },
              child:  Text('AR',style:TextStyle(color: Colors.blueGrey,)),
              // Image.asset(
              //   'assists/images/Screenshot 2023-09-07 164551.png',
              //   height: size.height,
              //   width: 60,color: Colors.blueGrey,
              // ),
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),



          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                // Get.toNamed('/navigated_home_2');
                _navigateTo('/navigated_home_2');
                // setState(() {
                //   final cartcontroller = Get.find<Cart_product_controller>();
                //   cartcontroller.getProductsFromCart();
                // });
              },

              // child:(CartEmpty.isTrue)?
              child: Badge(
                child: Icon(
                  Icons.shopping_bag,
                  color: isSelected('/navigated_home_2') ?Colors.black:Colors.blueGrey,
                ),
              ),
              //         :   Icon(
              //   Icons.shopping_bag,
              //     color: isSelected('/navigated_home_2') ?Colors.black:Colors.blueGrey,
              // ),


              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),


          // Expanded(
          //   flex: 1,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       _navigateTo('/navigated_home_2');
          //     },
          //     style: ElevatedButton.styleFrom(
          //       elevation: 0,
          //       backgroundColor: Colors.white,
          //       foregroundColor: Colors.white,
          //       shape: StadiumBorder(),
          //     ),
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Badge(
          //           child: Icon(
          //             Icons.shopping_bag,
          //             color: isSelected('/navigated_home_2') ? Colors.black : Colors.blueGrey,
          //           ),
          //         ),
          //         Positioned(
          //           right: 0,
          //           top: 0,
          //           child: Container(
          //             padding: EdgeInsets.all(2),
          //             decoration: BoxDecoration(
          //               color: Colors.red, // Background color of the badge
          //               shape: BoxShape.circle,
          //             ),
          //             child: Text(
          //               '5', // Your badge text here
          //               style: TextStyle(
          //                 color: Colors.white, // Text color
          //                 fontSize: 12, // Font size
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),



          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                _navigateTo('/navigated_home_3');
              },
              child: Icon(
                Icons.account_circle_rounded,
                color: isSelected('/navigated_home_3') ? Colors.black:Colors.blueGrey,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),



        ],
      ),
    );
  }
}
