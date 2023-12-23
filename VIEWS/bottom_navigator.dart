import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import 'package:untitled1/CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
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

  ProductController productController=Get.find<ProductController>();
 // CartProductController cartproductcontroller=Get.put(CartProductController());
  void _navigateTo(String routeName) {
    if (Get.previousRoute == routeName) {
      Get.until(ModalRoute.withName(routeName));
    }
    else {
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
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.07,
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
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                _navigateTo('/home');
              },
              child:
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
                  Icon(
                    Icons.home,
                    color: isSelected('/home') ? Colors.black : Colors.blueGrey,
                  ),
              //     Text("Home",style: TextStyle(color: Colors.black,fontSize: size.width*0.023),)
              //   ],
              // ),
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
              //  productController.fetchProductsFromPanel('Featuring_panel');
                // Get.toNamed('/navigated_home_0');
                _navigateTo('/navigated_home_0');
              },
              child:
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
                  Icon(
                    Icons.search,
                    color: isSelected('/navigated_home_0') ?Colors.black:Colors.blueGrey,
                  ),
                  // Text("Search",style: TextStyle(color: Colors.black,fontSize: size.width*0.020),)
              //   ],
              // ),
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
                Get.toNamed('/navigated_home_2');
                // _navigateTo('/navigated_home_2');
                setState(() {
                  final cartcontroller = Get.find<CartProductController>();
                  cartcontroller.fetchProducts();
                });
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
