import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import 'Bag_items_panel.dart';



class BagBody extends StatefulWidget {
  @override
  State<BagBody> createState() => _BodyState();
}

class _BodyState extends State<BagBody> {
  final cartcontroller = Get.find<CartProductController>();

  RxBool CartEmpty = true.obs;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Call getProductsFromCart when the page is initialized
  //   // final cartcontroller = Get.find<CartProductController>();
  //   // cartcontroller.fetchProducts().then((_) {
  //   //   // Ensure the UI reflects the latest data
  //   //  CartEmpty.value = cartcontroller.isCartEmpty.value;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      color: Colors.blue,
      displacement: 200,
      onRefresh: () async {
        cartcontroller.fetchProducts(); // Refresh the data
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Cart_items_display(),
            SizedBox(height:  size.height * 0.066,)

          ],
        ),
      ),
    );
  }
}
