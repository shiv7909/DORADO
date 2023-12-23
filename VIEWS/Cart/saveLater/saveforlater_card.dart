import 'package:flutter/material.dart';
import 'package:untitled1/MODELS/cart_products_model.dart';
import '../../../../CONTROLLERS/Cart/Functionality_controllers/saved_for_later_controller.dart';
import '../../../../MODELS/constants.dart';
import '../../../../CONTROLLERS/Cart/Functionality_controllers/product_in_cart_incre_decre.dart';


class Bag_savelater_Item extends StatefulWidget {

  final CartProduct saveLaterProducts;
  final Product_incre_decre_remo_cart_controller cartController;
  final   Saved_for_later saveforlater;
  final Function() onRemove;

  Bag_savelater_Item({
    required this.saveLaterProducts,
    required this.cartController,
    required this.saveforlater,
    required this.onRemove,
  });



  @override
  _CartProductItemState createState() => _CartProductItemState();
}

class _CartProductItemState extends State<Bag_savelater_Item> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return
      Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey[100],
              ),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      children: [
                        // widget.saveLaterProducts.stockExists == true ?
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            // color:     Color(0xFFE6FDF3),
                          ),
                          height: size.height * 0.15,
                          width: size.width * 0.3,

                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                                widget.saveLaterProducts.imagepath),
                          ),
                        ),
                      ]),

                  Expanded(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 4, top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${widget.saveLaterProducts.Title}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ))
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                bottom: 4, top: 4, right: size.width * 0.2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.saveLaterProducts.Description}',
                                    style: TextStyle(
                                        fontSize: 13
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )),

                        Container(
                          margin: EdgeInsets.only(bottom: 4, top: 4),
                          child: Row(
                            children: [
                              Text(
                                'Size: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                              Container(
                                child: Text(
                                  ' ${widget.saveLaterProducts.size}  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),

                              ),
                            ],
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: size.width *
                                    0.1),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "\₹${widget.saveLaterProducts.nprice}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: size.width *
                                    0.1),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "\₹${widget.saveLaterProducts.oprice}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: kPrimarycolor,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),



                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.onRemove();
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white
                                    ),
                                    child: FittedBox(
                                      child: Text('Remove', style: TextStyle(
                                          fontSize: 13
                                      ),),
                                    )),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]); // Return an empty widget when the quantity is zero
  }






  Widget buildDimOverlay(Size size) {
    return Container(

      width: size.width,
      height: size.height * 0.1,
      color: Colors.black.withOpacity(0.5), // Semi-transparent dim overlay
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Save for Later'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Remove'),
            ),
          ],
        ),
      ),
    );
  }


}




//
//
// class DiscountBadge extends StatelessWidget {
//   final int discountPercentage;
//
//   DiscountBadge({required this.discountPercentage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.red, // Background color of the badge
//         shape: BoxShape.circle, // Circular shape
//       ),
//       padding: EdgeInsets.all(8.0), // Adjust the padding as needed
//       child: Text(
//         '$discountPercentage%',
//         style: TextStyle(
//             color: Colors.white, // Text color
//             fontWeight: FontWeight.bold,
//             fontSize: 8// Text bold
//         ),
//       ),
//     );
//   }
// }
