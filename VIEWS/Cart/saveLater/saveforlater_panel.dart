//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled1/VIEWS/Cart/saveLater/saveforlater_card.dart';
// import '../../../../CONTROLLERS/Cart/Retriving_controllers/emptybag_icon_controller.dart';
// import '../../../../CONTROLLERS/Cart/Functionality_controllers/saved_for_later_controller.dart';
// import '../../../../CONTROLLERS/Cart/Retriving_controllers/saveforlater_items_retrive_controller.dart';
// import '../../../../CONTROLLERS/Cart/Functionality_controllers/product_in_cart_incre_decre.dart';
//
// class Cart_save_for_later_items_display extends StatefulWidget {
//   @override
//   _Cart_save_for_later_items_displayState createState() => _Cart_save_for_later_items_displayState();
// }
//
// class _Cart_save_for_later_items_displayState extends State<Cart_save_for_later_items_display> {
//
//   final Product_incre_decre_remo_cart_controller cartController =  Product_incre_decre_remo_cart_controller();
//   final CartIconController Cart_icon=CartIconController();
//   final Saved_for_later save4later=Saved_for_later();
//
//   bool isLoading = true;
//   String imageUrl = '';
//
//   @override
//   void initState() {
//     super.initState();
//     final savedlatercontroller = Get.find<SavedForLaterController>();
//     savedlatercontroller.getSavedForLaterProducts().then((_) {
//       // Ensure the UI reflects the latest data
//       setState(() {
//         isLoading = false; // Data is loaded
//       });
//     });
//
//     // Fetch the image URL from Firestore here
//     Cart_icon.getCartIcon().then((cartIcon) {
//       if (cartIcon != null) {
//         setState(() {
//           imageUrl = cartIcon.imageUrl;
//         });
//       }
//     }
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     // final cartcontroller = Get.find<Saved_for_later>();
//     final  savedForLaterProduct = cartcontroller.savedForLaterProducts;
//
//     Size size=MediaQuery.of(context).size;
//
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       child: isLoading
//           ? FutureBuilder(
//           future: Future.delayed(
//               const Duration(seconds: 5), () => true),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Container(
//                 height: size.height*0.42,
//                 margin: EdgeInsets.only(top: 80,bottom: 34),
//                 child: Center(
//                   child:
//                   CircularProgressIndicator(
//                     color: Colors.brown,
//                     strokeWidth: 4,
//                   ), // Show a loading indicator for 2 seconds
//                 ),
//               );
//             } else
//               return ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.all(0),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return ShimmerCartProductItem();
//                 },
//               ); // Show a shimmer effect after 2 seconds
//           })
//
//           : Obx(() {
//         return ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.all(0),
//           itemCount:  savedForLaterProduct.length,
//           itemBuilder: (context, index) {
//
//             // final savedForLaterProducts = savedForLaterProduct[index];
//
//             return Bag_savelater_Item(
//               saveLaterProducts: savedForLaterProduct[index],
//               cartController: cartController,
//               saveforlater: save4later,
//               onRemove: () {
//                 final savedForLaterProducts = savedForLaterProduct[index];
//                 save4later.removeItemFrom_saveForLater(savedForLaterProducts.id, savedForLaterProducts.size);
//                 setState(() {
//                   // savedForLaterProduct.remove(savedForLaterProduct[index]);
//                   savedForLaterProduct.remove(savedForLaterProduct[index]);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       duration: Duration(milliseconds: 700),
//                         content: Text(
//                           "Item removed from Save for Later!",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         backgroundColor: Colors.lightBlue[300],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 1,
//                       ),
//                   );
//                 });
//               },
//             );
//           },
//         );
//
//       }),
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
//
//
//
//
//
//
//
//
//
//
// class ShimmerCartProductItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//         color: Colors.white,
//       ),
//       margin: EdgeInsets.only(bottom: 5, top: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                 height: size.height * 0.12,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   child: Container(
//                     width: size.width * 0.2,
//                     height: size.height * 0.12,
//                     color: Colors.grey[100], // Shimmer placeholder color
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Container(
//                   margin: EdgeInsets.only(bottom: 4, top: 20),
//                   width: size.width/2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10),
//                     ),
//                     color: Colors.grey[100],
//                   ),
//                   height: 20,
//                 ),
//
//                 Container(
//                   margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
//                   height: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10),
//                     ),
//                     color: Colors.grey[100],
//                   ),// Shimmer placeholder color
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
//                   width: size.width/2,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10),
//                     ),
//                     color: Colors.grey[100],
//                   ),// Shimmer placeholder color
//                 ),
//
//
//                 Container(
//                   margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
//                   width: size.width/2,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10),
//                     ),
//                     color: Colors.grey[100],
//                   ),// Shimmer placeholder color
//                 ),
//
//
//
//                 Container(
//                   margin: EdgeInsets.only(top: 5,bottom: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                             right: 8, left: 10, top: 10, bottom: 10),
//                         width: size.width * 0.07,
//                         height: size.height * 0.02,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: CircleBorder(),
//                             padding: EdgeInsets.all(0),
//                             foregroundColor: Colors.white,
//                             backgroundColor:
//                             Colors.grey[100], // Shimmer placeholder color
//                           ),
//                           child: Icon(
//                             Icons.remove,
//                             size: 15,
//                           ),
//                           onPressed: () {},
//                         ),
//                       ),
//                       Text(
//                         '0', // Placeholder quantity
//                         style: TextStyle(
//                           fontSize: 13,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(
//                             right: 10, left: 8, top: 10, bottom: 10),
//                         width: size.width * 0.07,
//                         height: size.height * 0.02,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: CircleBorder(),
//                             foregroundColor: Colors.white,
//                             backgroundColor:
//                             Colors.grey[100], // Shimmer placeholder color
//                             padding: EdgeInsets.all(0),
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             size: 15,
//                           ),
//                           onPressed: () {},
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
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
