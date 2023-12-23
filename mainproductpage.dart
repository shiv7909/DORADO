import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/VIEWS/Search/Sub/counter.dart';

import 'CONTROLLERS/main_product_card/Functionality_controllers/product_Add_in_cart_controller.dart';
import 'VIEWS/Other_homes.dart';
import 'mainpeoductController.dart';
import 'mainproductModel.dart';
import 'mainproductModel.dart';
import 'mainproductModel.dart';

class ProductDisplayScreen extends StatefulWidget {
  ProductDisplayScreen({
    required this.id,
    required this.varid,
  });
  final String id;
  final String varid;

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  final ParticularProductController controller =
      Get.put(ParticularProductController());
  final PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();

  int _currentPage = 0;
  bool isPressed1= false;
  bool isPressed2= false;

  int selectedSizeIndex = -1;

  final Product_Add_controller product_in_cart_controller = Product_Add_controller();


  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    // void dispose() {
    //   // Dismiss the SnackBar when the route is disposed
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      super.dispose();
    // }
    // super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      // Call your method from the controller to fetch products
      await controller.findProductDocument(widget.id, widget.varid);
    } catch (e) {
      // Handle errors if any
      print('Error fetching products: $e');
    }
  }




  void SnackBar1(Size size){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content:
          Container(
             // color: Colors.white,
            // height: size.height*0.5,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  height: size.height*0.06,
                  margin: EdgeInsets.only(bottom: 15),
                  width: size.width,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Successfully added to cart    ",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
                        ,),
                      Icon(Icons.verified,color: Colors.white,)
                    ],
                  ),
                  ),
              ],
            ),
          ),
         // behavior: SnackBarBehavior.floating,
          elevation: 1,
          duration: Duration(milliseconds: 400),
          padding: EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,

        ));
  }






  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 23,
                )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Get.to(() => navigated_Home(index: 2));
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 22,
                      )),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(children: [
              // FloatingActionButton(onPressed: (){}),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return Center(
                        child: Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      // Adjust the base and highlight colors
                      highlightColor: Colors.black,
                      child: Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        alignment: Alignment.center,
                        child: Text(
                          'LOADING ...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          maxLines: 2,
                        ),
                      ),
                    ));
                  } else if (controller.hasError.value) {
                    return Center(child: Text('Error fetching data'));
                  } else if (controller.products.isEmpty ||
                      controller.products[0].images.isEmpty) {
                    return Center(
                        child: Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      // Adjust the base and highlight colors
                      highlightColor: Colors.black,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: size.height / 2),
                        alignment: Alignment.center,
                        child: Text(
                          'LOADING ...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          maxLines: 2,
                        ),
                      ),
                    ));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.45,
                          width: size.width,
                          child: Stack(children: [
                            PageView.builder(
                              controller: _pageController,
                              itemCount: 200,
                              onPageChanged: (int index) {
                                setState(() {
                                  _currentPage = index %
                                      controller.products[0].images.length;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Image.network(
                                  controller.products[0].images[index %
                                      controller.products[0].images.length],
                                  width: size.width,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),

                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  controller.products[0].images.length,
                                  (index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width:
                                            _currentPage == index ? 10.0 : 2.0,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: _currentPage == index
                                              ? Colors.black87
                                              : Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(1))),
                                  alignment: Alignment.center,
                                  height: size.height * 0.029,
                                  width: size.width * 0.13,
                                  // color: Colors.white,
                                  child: Text(
                                    "-${controller.products[0].discount} %",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width / 28,
                              right: size.width / 28,
                              top: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.products[0].Description}"
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.051,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹ ${controller.products[0].nprice}",
                                      style: TextStyle(
                                          fontSize: size.width * 0.037,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.08,
                                    ),
                                    Text("₹ ${controller.products[0].oprice}",
                                        style: TextStyle(
                                          fontSize: size.width * 0.035,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.003,
                                ),
                                Text(
                                  "incl. of all Taxes",
                                  style: TextStyle(fontSize: size.width * 0.03),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                // Container(
                                //   width: size.width,
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                Text(
                                  "size",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 4, bottom: 8),
                                  height: size.height * 0.045,
                                  //Adjust this height based on your requirement
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.products.isNotEmpty
                                        ? controller.products[0].sizes.length
                                        : 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final sizeInfo =
                                          controller.products[0].sizes[index];
                                      return GestureDetector(
                                        onTap: () {
                                          if (sizeInfo.availableItems > 0) {
                                            setState(() {
                                              selectedSizeIndex = index;
                                            });
                                            // Scroll to the selected size
                                            // _scrollController
                                            //     .
                                            //     // animateTo(
                                            //     //     2, duration: Duration(seconds: 2), curve: Curves.ease);
                                            //     animateTo(
                                            //   index * (size.width * 0.1),
                                            //   duration:
                                            //       Duration(milliseconds: 100),
                                            //   curve: Curves.easeIn,
                                            // );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "size out of stock!",
                                                  textAlign: TextAlign.center,
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                          }
                                          ;
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: size.width * 0.15,
                                          margin: EdgeInsets.only(
                                              top: 2, bottom: 2, right: 6),
                                          decoration: BoxDecoration(
                                            color: selectedSizeIndex == index
                                                ? Colors.blue
                                                : Colors.white,
                                            border: sizeInfo.availableItems > 0
                                                ? Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  )
                                                : Border.all(
                                                    color:
                                                        Colors.grey.shade300),
                                            // borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            sizeInfo.size,
                                            style: TextStyle(
                                              color: selectedSizeIndex == index
                                                  ? Colors.white
                                                  : sizeInfo.availableItems > 0
                                                      ? Colors.black
                                                      : Colors.grey,
                                              fontSize: size.width * 0.034,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                selectedSizeIndex != -1
                                    ? Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Selected size: ${controller.products[0].sizes[selectedSizeIndex].size}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Container(),

                                InkWell(
                                  splashColor:
                                      Colors.white, // Define the splash color
                                  onTap: () {
                                    setState(() {
                                      if (selectedSizeIndex != -1)
                                      isPressed1 = true; // Set pressed state to true
                                    });
                                    Future.delayed(Duration(milliseconds: 200),
                                        () {
                                      setState(() {
                                        isPressed1 = false; // Reset pressed state after a delay
                                      });
                                    });
                                    // Your existing functionality here
                                    if (selectedSizeIndex != -1) {
                                      product_in_cart_controller.ADD(
                                        controller.products[0].id,
                                        controller.products[0].varid,
                                        controller.products[0].sizes[selectedSizeIndex].size,
                                      );
                                      Future.delayed(Duration(milliseconds: 200),
                                          () {
                                            SnackBar1(size);
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(
                                              bottom: size.height / 4),
                                          content: Text(
                                            "Please select a size!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          elevation: 1,
                                          duration: Duration(milliseconds: 700),
                                          backgroundColor: Colors.white,
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                  child: Stack(
                                    children:[ 
                                      AnimatedContainer(
                                        padding: EdgeInsets.only(right : 10),
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      margin:isPressed1?
                                      EdgeInsets.only(left: (size.width / 28) * 3,right: (size.width / 28) * 3,top: size.height*0.0125,bottom: size.height*0.0125):
                                      EdgeInsets.only(left: 0),
                                      width: isPressed1?
                                      size.width - ((size.width / 28) * 6):
                                      size.width - ((size.width / 28) * 2),
                                      alignment: Alignment.center,
                                      height: isPressed1?
                                      size.height * 0.04:
                                      size.height * 0.065,
                                      decoration: BoxDecoration(
                                        color: isPressed1
                                            ? Colors.orange.withOpacity(0.4)
                                            : selectedSizeIndex != -1
                                                ? Colors.orange
                                                : Colors.grey,
                                         // borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          Text(
                                            "Add to Bag",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Icon(Icons.shopping_bag_outlined,size: size.width*0.05,color: Colors.white,)
                                        ],
                                      ),
                                    ),
                                    ]
                                  ),
                                ),



                                SizedBox(
                                  height: 10,
                                ),

                                InkWell(
                                  splashColor:
                                  Colors.white, // Define the splash color
                                  onTap: () {
                                    setState(() {
                                      if (selectedSizeIndex != -1)
                                        isPressed2 = true; // Set pressed state to true
                                    });
                                    Future.delayed(Duration(milliseconds: 200),
                                            () {
                                          setState(() {
                                            isPressed2 = false; // Reset pressed state after a delay
                                          });
                                        });
                                    // Your existing functionality here
                                    if (selectedSizeIndex != -1) {
                                      // product_in_cart_controller.ADD(
                                      //   controller.products[0].id,
                                      //   controller.products[0].id,
                                      //   controller.products[0]
                                      //       .sizes[selectedSizeIndex].size,
                                      // );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.only(
                                              bottom: size.height / 2),
                                          content: Text(
                                            "Please select a size!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          elevation: 2,
                                          duration: Duration(milliseconds: 500),
                                          backgroundColor: Colors.white70,
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                  child: Stack(
                                      children:[
                                        AnimatedContainer(
                                          padding: EdgeInsets.only(right: 10),
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          margin:isPressed2?
                                          EdgeInsets.only(left: (size.width / 28) * 3,right: (size.width / 28) * 3,top: size.height*0.0125,bottom: size.height*0.0125):
                                          EdgeInsets.only(left: 0),
                                          width: isPressed2?
                                          size.width - ((size.width / 28) * 6):
                                          size.width - ((size.width / 28) * 2),
                                          alignment: Alignment.center,
                                          height: isPressed2?
                                          size.height * 0.04:
                                          size.height * 0.065,
                                          decoration: BoxDecoration(
                                            color: isPressed2
                                                ? Colors.orange.withOpacity(0.4)
                                                : selectedSizeIndex != -1
                                                ? Colors.orange
                                                : Colors.grey,
                                            // borderRadius: BorderRadius.circular(4.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              Text(
                                                "Buy now",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Icon(Icons.arrow_forward_outlined,size: size.width*0.05,color: Colors.white,)
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //     height: isPressed1?
                                        //     size.height * 0.04:
                                        //     size.height * 0.065,
                                        //   width: isPressed1?
                                        //
                                        //   size.width - ((size.width / 28) * 6):
                                        //   size.width - ((size.width / 28) * 2),
                                        //   alignment: Alignment.centerRight,
                                        //   // color: Colors.black,
                                        //   //   height:size.height * 0.065,
                                        //   child: Icon(Icons.shopping_bag)
                                        // )

                                        // Positioned(
                                        //     right:5,
                                        //     bottom:size.height * 0.065/4,
                                        //     child: Icon(Icons.shopping_bag))
                                      ]
                                  ),
                                ),

                                //     ],
                                //   ),
                                //
                                // ),
                                // AddCounter(id: widget.id),
                                SizedBox(
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: Container(
                                    color: Colors.orange,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    );
                  }
                },
              )
            ]),
          )),
    );
  }
}
