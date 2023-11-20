

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import '../../../../CONTROLLERS/Cart/Retriving_controllers/emptybag_icon_controller.dart';
import '../../../../CONTROLLERS/Cart/Functionality_controllers/saved_for_later_controller.dart';
import 'Bag_item_product_card.dart';
import '../../../../CONTROLLERS/Cart/Functionality_controllers/product_in_cart_incre_decre.dart';

class Cart_items_display extends StatefulWidget {

  @override
  _Cart_items_displayState createState() => _Cart_items_displayState();
}

class _Cart_items_displayState extends State<Cart_items_display> {

  final Product_incre_decre_remo_cart_controller cartController =  Product_incre_decre_remo_cart_controller();
  final CartIconController Cart_icon=CartIconController();
   final Saved_for_later save4later=Saved_for_later();

  bool isLoading = true;
  String imageUrl = '';
  bool isCartEmpty = false;

@override
  void initState() {
  // setState(() {
  //   // final cartcontroller = Get.find<Cart_product_controller>();
  //   // cartcontroller.getProductsFromCart();
  // });
    super.initState();
    final cartcontroller = Get.find<Cart_product_controller>();
    cartcontroller.getProductsFromCart().then((_) {
      // Ensure the UI reflects the latest data
      setState(() {
        isLoading = false; // Data is loaded
      });
    });

    // Fetch the image URL from Firestore here
    Cart_icon.getCartIcon().then((cartIcon) {
      if (cartIcon != null) {
        setState(() {
          imageUrl = cartIcon.imageUrl;
        });
      }
    });
  }


@override
  Widget build(BuildContext context) {
  final cartcontroller = Get.find<Cart_product_controller>();
  final cartProducts = cartcontroller.cartProducts;

  Size size = MediaQuery
      .of(context)
      .size;

  return Container(
    child: isLoading
        ? FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () => true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: size.height * 0.42,
              margin: EdgeInsets.only(top: 80, bottom: 34),
              child: Center(
                child:
                CircularProgressIndicator(
                  color: Colors.brown,
                  strokeWidth: 4,
                ), // Show a loading indicator for 2 seconds
              ),
            );
          } else
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ShimmerCartProductItem();
              },
            ); // Show a shimmer effect after 2 seconds
        })
        : cartcontroller.isCartEmpty == true ?
    Center(
      child: Container(
          alignment: Alignment.center,
          height: size.height * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(imageUrl.isEmpty)
                Icon(Icons.shopping_bag)
              else
                Image.network(imageUrl, height: size.height * 0.2,),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text('Your cart is empty', style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),)),
            ],
          )),
    )

        : Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartProduct = cartProducts[index];
          return
          CartProductItem(
              cartProduct: cartProduct,
              cartController: cartController,
              saveforlater: save4later,
            // ),
          );
        },
      );
    },
    ),
  );
}}








class ShimmerCartProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

     return Shimmer.fromColors(
        baseColor: Colors.grey[350]!, // Adjust the base and highlight colors
        highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: EdgeInsets.only(bottom: 5, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  height: size.height * 0.12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: size.width * 0.2,
                      height: size.height * 0.12,
                      color: Colors.grey[100], // Shimmer placeholder color
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsets.only(bottom: 4, top: 20),
                            width: size.width/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                      color: Colors.grey[100],
                    ),
                            height: 20,
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
                            height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                      color: Colors.grey[100],
                    ),// Shimmer placeholder color
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
                    width: size.width/2,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                      color: Colors.grey[100],
                    ),// Shimmer placeholder color
                  ),


                  Container(
                    margin: EdgeInsets.only(bottom: 4, top: 4,right: 20),
                    width: size.width/2,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                      color: Colors.grey[100],
                    ),// Shimmer placeholder color
                  ),



                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 8, left: 10, top: 10, bottom: 10),
                          width: size.width * 0.07,
                          height: size.height * 0.02,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(0),
                              foregroundColor: Colors.white,
                              backgroundColor:
                              Colors.grey[100], // Shimmer placeholder color
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Text(
                          '0', // Placeholder quantity
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 10, left: 8, top: 10, bottom: 10),
                          width: size.width * 0.07,
                          height: size.height * 0.02,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              foregroundColor: Colors.white,
                              backgroundColor:
                              Colors.grey[100], // Shimmer placeholder color
                              padding: EdgeInsets.all(0),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



