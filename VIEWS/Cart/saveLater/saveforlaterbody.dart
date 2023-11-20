
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/CONTROLLERS/Cart/Retriving_controllers/saveforlater_items_retrive_controller.dart';
import 'package:untitled1/VIEWS/Cart/saveLater/saveforlater_panel.dart';




class SaveforLater_body extends StatefulWidget {

  @override
  State<SaveforLater_body> createState() => _BodyState();
}


class _BodyState extends State<SaveforLater_body>  {

  final cartc= Get.find<SavedForLaterController>();

  Future<void> _fetchUpdatedData() async {
    cartc.getSavedForLaterProducts();
  }


  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    // Call getProductsFromCart when the page is initialized
    // final cartcontroller = Get.find<Cart_product_controller>();
     final cartc= Get.find<SavedForLaterController>();
    cartc.getSavedForLaterProducts().then((_) {
      // Ensure the UI reflects the latest data
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blue,
      displacement: 200,
      onRefresh: () async {
        _fetchUpdatedData();
      },
      child:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Cart_save_for_later_items_display(),
          ],
        ),
      ),
    );
  }
}


