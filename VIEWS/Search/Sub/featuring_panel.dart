import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package
import 'package:untitled1/CONTROLLERS/QuoteController.dart';
import 'package:untitled1/VIEWS/Search/Sub/productcard1.dart';
import '../../../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';

class FeaturingPanel extends StatefulWidget {


  @override
  State<FeaturingPanel> createState() => _FeaturingPanelState();
}

class _FeaturingPanelState extends State<FeaturingPanel> {

  QuoteController quoteController = Get.put(QuoteController());
  ProductController Productcontroller=Get.find<ProductController>();

  int maxProductsToShow = 10;
  String quote='';

  @override
  void initState() {
    super.initState();
      // Productcontroller.fetchProducts();
  }

  // Function to load more products
  void loadMoreProducts() {
    setState(() {

      quoteController.getQuote('Featuringpanel_quote').then((Quote) {
        if (Quote != null) {
          setState(() {
            quote = Quote.quote;
          });
        }
      }
      );

      // maxProductsToShow += 10; // Increase the number of products to show
    });
  }



  // Function to build a shimmering placeholder
  Widget buildShimmerPlaceholder(Size size) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Adjust the base and highlight colors
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: size.width * 0.4 + 30,
            height: size.height * 0.2 + 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 4),
            width: (size.width * 0.4 + 30) / 2,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 4),
            width: size.width * 0.4 + 30,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool showText = true; // Control flag to show text for the first 4 seconds

    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 4)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // After 4 seconds, hide the text and show shimmering placeholders
            showText = false;
          }
          return Obx(() {
            if (Productcontroller.isLoading.value) {
              if (showText) {
                // Show text for the first 4 seconds
                return
                    Shimmer.fromColors(
                      baseColor: Colors.grey[500]!, // Adjust the base and highlight colors
                      highlightColor: Colors.black,
                      child:
                        Container(
                        margin: EdgeInsets.only(left: 30,right: 30),
                        alignment: Alignment.center,
                          height: size.height * 0.42,
                        child:
                         Text(quote,style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.black54
                          ),
                            maxLines: 2,
                          ),
                      ),
                    );


              } else {
                // After 4 seconds, show shimmering placeholders
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      maxProductsToShow,
                      (index) {
                        return buildShimmerPlaceholder(size);
                      },
                    ),
                  ),
                );
              }
            } else if (Productcontroller.products.isEmpty) {
              return Container(
                  height: size.height * 0.4 + 5,
                  child: Text('No products available.'));
            } else {
              return Container(
                  height: size.height * 0.395,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: maxProductsToShow,
                  itemBuilder: (context, index) {
                    if (index < Productcontroller.products.length) {
                      final product = Productcontroller.products[index];
                      return productcard1(
                        productController: Productcontroller,
                        id: product.id,
                        title: product.Title,
                        description: product.Description,
                        oprice: product.oprice,
                        nprice: product.nprice,
                        discount: product.discount,
                        quantity: product.Quantity,
                        imagePath: product.imagepath,
                        no_of_variations: product.No_of_Variations,
                        color: product.color,

                      );
                    } else if (index == Productcontroller.products.length) {
                      // Display a "Load More" button when reaching the end
                      return ElevatedButton(
                        onPressed: loadMoreProducts,
                        child: Text('Load More'),
                      );
                    } else {
                      // Return an empty container for indices greater than the product count
                      return Container();
                    }
                  },
                ),
              );
            }
          });
        });
  }
}




