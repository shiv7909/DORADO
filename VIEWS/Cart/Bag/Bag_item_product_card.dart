// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled1/CONTROLLERS/Cart/Functionality_controllers/saved_for_later_controller.dart';
// import 'package:untitled1/MODELS/cart_products_model.dart';
// import '../../../../CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
// import '../../../../MODELS/constants.dart';
// import '../../../../CONTROLLERS/Cart/Functionality_controllers/product_in_cart_incre_decre.dart';
// import '../../Other_homes.dart';
//
//
// class CartProductItem extends StatefulWidget {
//
//   final Product cartProduct;
//   final Product_incre_decre_remo_cart_controller cartController;
//   final Saved_for_later saveforlater;
//
//   CartProductItem({
//     required this.cartProduct,
//     required this.cartController,
//     required this.saveforlater,
//   });
//
//   @override
//   _CartProductItemState createState() => _CartProductItemState();
// }
//
//
//
// class _CartProductItemState extends State<CartProductItem> {
//   late int quantity;
//
//   final cartController = Get.find<Cart_product_controller>();
//
//
//   @override
//   void initState() {
//     super.initState();
//     quantity = widget.cartProduct.quantity;
//   }
//
//
//   void remove() {
//     setState(() {
//       quantity = 0;
//     });
//
//     Future.delayed(Duration(seconds: 1), () {
//       CircularProgressIndicator();
//       if (widget.cartController.isCartEmpty.value) {
//         showCartEmptyOverlay();
//       }
//     });
//   }
//
//
//
//
//   void incrementQuantity() {
//     setState(() {
//       quantity++;
//     });
//     widget.cartController.increment_cart(widget.cartProduct.size, widget.cartProduct.id);
//   }
//
//
//
//
//
//   void decrementQuantity() {
//     if (quantity > 0) {
//       setState(() {
//         quantity--;
//       });
//
//       Future.delayed(Duration(seconds: 1), () {
//         if (widget.cartController.isCartEmpty.value) {
//           showCartEmptyOverlay();
//         }
//       });
//     }
//   }
//
//
//
//   void saveforlater() {
//     setState(() {
//       quantity = 0;
//     });
//     Future.delayed(Duration(seconds: 1), () {
//       if (widget.cartController.isCartEmpty.value) {
//         showCartEmptyOverlay();
//       }
//     });
//   }
//
//
//
//
//   void showCartEmptyOverlay() {
//     Get.off(() => navigated_Home(index: 2));
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     int dis=widget.cartProduct.oprice-widget.cartProduct.nprice;
//
//     return quantity > 0
//         ?
//         Dismissible(
//         key: UniqueKey(),
//         background: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             // color: Color(0xFF835F44)
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomLeft,
//                   colors: [
//                     Color(0xB01E272E),
//                     Color(0xB0838485),
//                   ]
//               )
//           ),
//           margin: EdgeInsets.only( top: 10),
//           child: Icon(
//             Icons.delete,
//             color: Colors.white,
//           ),
//         ),
//         onDismissed: (direction) {
//           if(direction==DismissDirection.startToEnd){
//           widget.cartController.decrement2_cart(widget.cartProduct.id, widget.cartProduct.size);
//           remove();}// You can pass additional parameters if needed
//         },
//           direction: DismissDirection.startToEnd,
//             child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                     color: Colors.grey[100],
//                   ),
//                    margin: EdgeInsets.only( top: 10),
//                   child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                           children: [
//                           widget.cartProduct.stockExists==true ?
//                           Container(
//                             margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 // color:     Color(0xFFE6FDF3),
//                             ),
//                             height: size.height*0.15,
//                             width: size.width * 0.3,
//                             child:
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                   child: Image.network(widget.cartProduct.image),
//                                 ),
//                           )
//                             :  ColorFiltered(
//                             colorFilter: ColorFilter.mode(
//                               Colors
//                                   .grey, // Use grey color for desaturation
//                               BlendMode
//                                   .saturation, // Apply saturation blend mode for grayscale effect
//                             ),
//                               child: Container(
//                               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                                 height: size.height*0.15,
//                               width: size.width * 0.3,
//                               child:
//                               ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: Image.network(widget.cartProduct.image),
//                               ),
//                           ),
//                             ),
//
//                             if(widget.cartProduct.stockExists==false)
//                             Container(
//                               child: Text('! No stock',style: TextStyle(
//                                 color: Colors.red,fontWeight: FontWeight.bold,
//                               ),),
//                             ),
//
//                             if(widget.cartProduct.stock<=20)
//                               Container(
//                                 width: size.width * 0.3,
//                                 child: FittedBox(
//                                   fit: BoxFit.scaleDown,
//                                   child: Text("Only ${widget.cartProduct.stock} left in stock",style: TextStyle(
//                                     color: Colors.red[900],fontWeight: FontWeight.w500,fontSize: 10
//                                   ),),
//                                 ),
//                               ),
//
//                       ]),
//                       Expanded(
//                         child: Column(
//                           // crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                                 margin: EdgeInsets.only(bottom: 9,top: 10),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                         child: FittedBox(
//                                       alignment: Alignment.centerLeft,
//                                       fit: BoxFit.scaleDown,
//                                       child: Text(
//                                         '${widget.cartProduct.title}',
//                                         style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black87),
//                                       ),
//                                     ))
//                                   ],
//                                 )),
//                             Container(
//                                 margin: EdgeInsets.only(bottom: 2, top: 4,right: size.width*0.2),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         '${widget.cartProduct.description}',
//                                         style: TextStyle(
//                                           fontSize: 13
//                                         ),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     )
//                                   ],
//                                 )),
//
//                             Container(
//                                margin: EdgeInsets.only(bottom: 2, top: 4),
//                               child: Row(
//                                 children: [
//                                 Text(
//                                       'Size: ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500, fontSize: 12,color: Colors.grey),
//                                     ),
//                                   Container(
//                                     child: Text(
//                                         ' ${widget.cartProduct.size}  ',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500, fontSize: 11),
//                                       ),
//
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             Container(
//                               margin: EdgeInsets.only(bottom: 2, top: 4),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Quantity: ',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500, fontSize: 12,color: Colors.grey),
//                                   ),
//                                    Container(
//                                     child: Text(
//                                       ' ${widget.cartProduct.quantity}  ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500, fontSize: 11),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                              Container(
//                                margin: EdgeInsets.only(top: 10),
//                                child: Row(
//                                   children: <Widget>[
//                                     Container(
//                                       margin: EdgeInsets.only(right: size.width*0.1),
//                                         child: FittedBox(
//                                           fit: BoxFit.scaleDown,
//                                           child: Text(
//                                             "\₹${widget.cartProduct.nprice}",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 13),
//                                             maxLines: 1,
//                                           ),
//                                         ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(right: size.width*0.1),
//                                       child: FittedBox(
//                                         fit: BoxFit.scaleDown,
//                                         child: Text(
//                                           "\₹${widget.cartProduct.oprice}",
//                                           style: TextStyle(
//                                             decoration: TextDecoration.lineThrough,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 11,
//                                             color: kPrimarycolor,
//                                           ),
//                                           maxLines: 1,
//                                         ),
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                              ),
//
//
//                             Container(
//                                margin: EdgeInsets.only(top: 3),
//                               child: Row(
//                                 // mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//
//                                   Visibility(
//                                   visible: widget.cartProduct.nprice<widget.cartProduct.oprice,
//                                   child:  Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(3),
//                                         width: size.width*0.14,
//                                         height: size.height*0.03,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
//                                           color:Colors.red,
//                                         ),
//                                         child: FittedBox(
//                                           fit: BoxFit.scaleDown,
//                                           child: Text(
//                                             "save ₹${dis}",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 fontSize: 10,
//                                                 color: Colors.white,
//                                                 // color: Colors.redAccent
//                                             ),
//                                             maxLines: 1,
//                                           ),
//                                         ),
//                                       ),
//                                   Container(
//                                     // alignment: Alignment.centerLeft,
//                                       width: size.width*0.14,
//                                       height: size.height*0.03,
//                                     padding: EdgeInsets.all(3),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
//                                       color:Colors.red,
//                                     ),
//                                     child: FittedBox(
//                                       fit: BoxFit.scaleDown,
//                                       child: Text(
//                                         '(${widget.cartProduct.discount}\%)',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 12,
//                                           color: Colors.white,
//                                           // color: Colors.redAccent
//                                         ),
//                                         maxLines: 1,
//                                       ),
//                                     ),
//                                   ),
//                                   ])),
//
//
//
//
//                                   Spacer(),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 8,top: 10,bottom: 15),
//                                     width: size.width * 0.07,
//                                     height: size.height * 0.03,
//                                     child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                           shape: CircleBorder(),
//                                           //padding: EdgeInsets.all(24),
//                                           padding: EdgeInsets.all(0),
//                                           foregroundColor: Colors.white,
//                                           backgroundColor: Colors.black38,),
//                                       child: Icon(
//                                         Icons.remove,
//                                         size: 15,
//                                       ),
//                                       onPressed: () {
//                                         widget.cartController.decrement2_cart(widget.cartProduct.id, widget.cartProduct.size);
//                                         decrementQuantity();
//                                       },
//                                     ),
//                                   ),
//                                   Text(quantity.toString(),style: TextStyle(
//                                       fontSize: 13
//                                   ),),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 10,left: 8,top: 10,bottom: 15),
//                                     width: size.width * 0.07,
//                                     height: size.height * 0.03,
//                                     child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         shape: CircleBorder(),
//                                         foregroundColor: Colors.white,
//                                         backgroundColor: Colors.black38,
//                                         padding: EdgeInsets.all(0),
//                                       ),
//                                       child: Icon(
//                                         Icons.add,
//                                         size: 15,
//                                       ),
//                                       onPressed: () {
//                                         widget.cartProduct.stockExists==true ?
//                                         incrementQuantity()
//                                         :
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(
//                                             showCloseIcon: true,
//                                             duration: Duration(milliseconds: 900),
//                                             shape: StadiumBorder(),
//                                             backgroundColor: Colors.red,
//                                             content: Container(
//                                               alignment: Alignment.center,
//                                               child: Column(
//                                                 children: [
//
//                                                   Text('item Out of Stock',style: TextStyle(
//                                                     fontWeight: FontWeight.bold
//                                                   ),),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             Container(
//                                 alignment: Alignment.centerLeft,
//                                 margin: EdgeInsets.only(top: 10,),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: (){
//                                             widget.cartController.saveForLater(widget.cartProduct.size, widget.cartProduct.id);
//                                             saveforlater();
//                                           },
//                                           child: Container(
//                                               margin: EdgeInsets.only(bottom: 4,right: 30),
//                                               padding: EdgeInsets.all(6),
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(width: 1,color: Color(
//                                                       0xFFDEDEDE),
//                                                   ),
//                                                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                                   color: Colors.white
//                                               ),
//                                               child: FittedBox(
//                                                 child: Text('save for later',style: TextStyle(
//                                                     fontSize: 13,fontWeight: FontWeight.w500
//                                                 ),),
//                                               )),
//                                         ),
//
//                                         GestureDetector(
//                                           onTap: (){{
//                                             widget.cartController.remove(widget.cartProduct.id, widget.cartProduct.size);
//                                             remove();
//                                           }
//                                           },
//                                           child: Container(
//                                             margin: EdgeInsets.only(bottom: 4),
//                                             padding: EdgeInsets.all(6),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(width: 1,color:Color(
//                                                   0xFFDEDEDE),
//                                               ),
//                                               borderRadius: BorderRadius.all(Radius.circular(10)),
//                                               color: Colors.white
//                                             ),
//                                               child: FittedBox(
//                                                 child: Text('Remove',style: TextStyle(
//                                                   fontSize: 13,fontWeight: FontWeight.w500
//                                                 ),),
//                                               )),
//                                         ),
//
//                                       ],
//                                 ),
//                               )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//           )
//         : SizedBox(); // Return an empty widget when the quantity is zero
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
// Widget buildDimOverlay(Size size) {
//   return Container(
//
//     width: size.width,
//     height: size.height*0.1,
//     color: Colors.black.withOpacity(0.5), // Semi-transparent dim overlay
//     child: Center(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ElevatedButton(
//             onPressed: (){},
//             child: Text('Save for Later'),
//           ),
//           ElevatedButton(
//             onPressed: (){},
//             child: Text('Remove'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
//
//
//
//
//
//
//
