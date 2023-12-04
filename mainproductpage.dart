
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import 'VIEWS/Other_homes.dart';
import 'mainpeoductController.dart';




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
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Call the method to fetch products
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

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[500]!,
                    // Adjust the base and highlight colors
                    highlightColor: Colors.black,
                    child:
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      child:
                      Text('LOADING ...', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54
                      ),
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
                    child:
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      child:
                      Text('LOADING ...', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54
                      ),
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
                    child: Stack(
                        children: [
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: _currentPage == index ? 10.0 : 2.0,
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1))
                                ),
                                alignment: Alignment.center,
                                height: size.height * 0.029,
                                width: size.width * 0.13,
                                // color: Colors.white,
                                child: Text(
                                  "-${controller.products[0].discount} %",
                                  style: TextStyle(fontSize: 13,
                                      fontWeight: FontWeight.w500),),
                              ))
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 10, top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.products[0].Description}"
                              .toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.055,
                                color: Colors.black),),
                          SizedBox(height: size.height * 0.02,),
                          Row(
                            children: [
                              Text("₹ ${controller.products[0].nprice}",
                                style: TextStyle(fontSize: size.width * 0.037,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(width: size.width * 0.1,),
                              Text("₹ ${controller.products[0].oprice}",
                                  style: TextStyle(fontSize: size.width * 0.035,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ))
                            ],
                          ),
                          SizedBox(height: size.height * 0.003,),
                          Text("incl. of all Taxes")
                        ]),),

                ],
              );
            }
          })),
    );
  }
}
