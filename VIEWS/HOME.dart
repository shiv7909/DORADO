import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
import 'Home/1_Home_body.dart';
import 'HOME_appbar.dart';
import 'bottom_navigator.dart';




class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  ProductController Productcontroller=Get.find<ProductController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: Home_appbar(),
      // body: body(controller:Productcontroller),
      // body: Cart(),
      body: Home_body(),
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: bottom_navigator( selectedRoute: '/home'),
    );
  }
}