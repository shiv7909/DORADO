//
//
//
// import 'package:flutter/material.dart';
// import '../../../CONTROLLERS/main_product_card/Functionality_controllers/product_Add_in_cart_controller.dart';
// import '../../../MODELS/product.dart';
//
// class AddCounter extends StatefulWidget {
//   AddCounter({
//     required this.sizes,
//     required this.id,
//   });
//
//   final List<SizeDetails> sizes;
//   final int id;
//
//   @override
//   _AddCounterState createState() => _AddCounterState();
// }
//
// class _AddCounterState extends State<AddCounter> {
//   String selectedSize = "";
//   final  Product_Add_controller  product_in_cart_controller=Product_Add_controller();
//
//   void addToCart(String size) {
//     setState(() {
//       product_in_cart_controller.increment_cart(size, widget.id);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             "Item added to cart size: $selectedSize",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//               color: Colors.white
//             ),
//           ),
//           duration: Duration(seconds: 1),
//           // Color(0xB01E272E),
//           // Color(0xFF2C3A47),
//           backgroundColor:
//           // Colors.grey[400],
//           Color(0xFF028043),
//           // Color(0xFF62A29A),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 8,
//         ),
//       );
//     });
//   }
//
//   void showOptionsDialog1() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Select the Size",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//
//                 // Map the sizes list to create buttons for each size
//                 ...widget.sizes.map(
//                       (sizeDetail) => ElevatedButton(
//                     onPressed: sizeDetail.availableItems != 0
//                         ? () {
//                       selectedSize = sizeDetail.size;
//                       addToCart(selectedSize);
//                       Navigator.of(context).pop();
//                     }
//                         : null,
//                     child: Text(
//                       sizeDetail.size,
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//           color: Color(
//               0xFFDEDEDE),
//           // gradient: LinearGradient(
//           //     begin: Alignment.topLeft,
//           //     end: Alignment.bottomRight,
//           //     colors: [
//           //       Color(0xCBFFFFFF),
//           //       Color(0xB0838485),
//           //       Color(0xB0F3F8FF),
//           //       Color(0xB0C8CACC),
//           //     ]
//           // ),
//         borderRadius: BorderRadius.all(Radius.circular(5))
//       ),
//        // width: size.width*0.12,
//       width: size.width * 0.11,
//       height: size.height * 0.029,
//       child: ElevatedButton(
//         onPressed: () {
//           showOptionsDialog1();
//         },
//         child: Text("Add", style: TextStyle(color: Colors.black87, fontSize: 11)),
//         style: ElevatedButton.styleFrom(
//           elevation: 2,
//           padding: EdgeInsets.all(0),
//           backgroundColor: Color(0xFFDEDEDE),
//         ),
//       ),
//     );
//   }
// }
