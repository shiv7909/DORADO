

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import 'Bag/Bag_body.dart';


class shopping_bag_PageWithOptions extends StatefulWidget {
  @override
  _shopping_bag_PageWithOptionsState createState() =>
      _shopping_bag_PageWithOptionsState();
}

class _shopping_bag_PageWithOptionsState
    extends State<shopping_bag_PageWithOptions>
// with AutomaticKeepAliveClientMixin
{
  int selectedOption = 0; // Default option
  PageController pageController = PageController(); // Add a PageController
  // RxBool iscartEmpty=true.obs;
  // bool isLoading = true;

  // @override
  // bool get wantKeepAlive => true;
  final cartcontroller = Get.find<CartProductController>();


  @override
  void dispose() {
    pageController.dispose(); // Dispose the PageController
    super.dispose();
  }


  @override
  void initState() {
    super.initState();

    cartcontroller.fetchProducts();
    // Fetch the cart value asynchronously
    // cartcontroller.isCartEmpty_value().then((cartValue) {
    //   setState(() {
    //     isLoading = false;
    //     iscartEmpty.value = cartValue;
    //   });
    // });
  }




  @override
  Widget build(BuildContext context) {


     Size size = MediaQuery.of(context).size;


    return Scaffold(
       backgroundColor: Color(0xffeae9e9),
      body: Column(
        children: [
          // Option buttons at the top
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: size.width / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedOption == 0 ? Color(0xFF2C3A47) : Color(
                              0x84EFEFEF),
                      elevation: selectedOption == 0 ? 1:4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOption = 0;
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                      });

                      // setState(() {
                      //
                      //   cartcontroller.getProductsFromCart();
                      // });
                    },
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Bag',
                          style: TextStyle(
                              fontSize:  selectedOption == 0 ? 13:10,
                              color: selectedOption == 0 ? Colors.white:Colors.black),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: size.width / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedOption == 1 ? Color(0xFF2C3A47) : Color(
                              0x84EFEFEF),
                      elevation: selectedOption == 1 ? 1:4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOption = 1;
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                      });
                    },
                    child: FittedBox(
                        child: Text(
                          "Virtual wardrobe",
                          style: TextStyle(
                            fontSize:  selectedOption == 1 ? 13:10,
                              color: selectedOption == 1 ? Colors.white:Colors.black
                          ),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: size.width / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedOption == 2 ? Color(0xFF2C3A47) : Color(
                              0x84EFEFEF),
                      elevation: selectedOption == 2 ? 1:4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius as needed
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOption = 2;
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.ease);
                      });
                    },
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'saved for later',
                          style: TextStyle(

                              fontSize:  selectedOption == 2 ? 13:10
                              ,color: selectedOption == 2 ? Colors.white:Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          ),
          // Container to display different bodies
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  selectedOption = index;
                });
              },
              itemCount: 3, // Number of pages
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Stack(
                    children: [
                      BagBody(),
                      // Obx(() {
                      //   if (!iscartEmpty.value) {
                      //     return Positioned(
                      //       bottom: 0,
                      //       child: Container(
                      //
                      //         // alignment: Alignment.center,
                      //              padding: EdgeInsets.only(left: 40),
                      //         height: size.height * 0.066,
                      //         width: size.width-40,
                      //
                      //         child: FloatingActionButton(
                      //           backgroundColor:  Color(0xFFF1B52B),
                      //           onPressed: () {
                      //             // Handle the action when the icon is pressed
                      //           },
                      //           shape: RoundedRectangleBorder(
                      //               side: BorderSide(width: 2,color: Colors.white),
                      //               borderRadius: BorderRadius.all(Radius.circular(10))),
                      //           child: Text(
                      //             'Checkout',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   } else
                      //     return SizedBox();
                      // }
                      // )
                    ],
                  );
                } else if (index == 1) {
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Welcome to the virtual Wardrobe'),
                    ),
                  );
                }
                // else {
                //   return SaveforLater_body();
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
