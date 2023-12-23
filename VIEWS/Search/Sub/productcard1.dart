import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/CONTROLLERS/main_product_card/Functionality_controllers/Favourites_controller.dart';
import 'package:untitled1/mainproductpage.dart';
import '../../../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
import '../../../mainpeoductController.dart';
import '../../../mainproductModel.dart';

class productcard1 extends StatefulWidget {
  // final ProductController productController;
  final FavouritesController Fav = FavouritesController();

  productcard1({
    // required this.productController,
    required this.id,
    required this.title,
    required this.description,
    required this.no_of_variations,
    required this.variationid,

    required this.oprice,
    required this.nprice,
    required this.discount,
    required this.color,

    required this.imagePath,
    required this.quantity,
    // required this.sizes,
    // required this.count_in_cart,
  }) ;
      // : imagePath = imageUrls.isNotEmpty ? imageUrls[0] : '';

  final String title, description, imagePath,color,id,variationid;
  final int oprice,
      nprice,
      discount,
      no_of_variations,
      quantity;

  @override
  State<productcard1> createState() => _productcard1State();
}

class _productcard1State extends State<productcard1> {

  ParticularProductController controller =Get.put(ParticularProductController());

  RxBool isFavorite = false.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
      Container(
        width: size.width / 2 - 4,
         // padding: EdgeInsets.only(top: 2, left: 2, right: 2),
        margin: EdgeInsets.only(
          left: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
            color: Colors.grey.shade100,
           //color: Colors.orange
        ),
          child: Column(
              children: <Widget>[
              Container(
                // color: Colors.orange,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: InkWell(
                      onTap: () {
                         // controller.findProductDocument(widget.id, widget.variationid);
                        Get.to(()=>ProductDisplayScreen(id: widget.id, varid: widget.variationid,));
                      },
                      child: SizedBox(
                        height: size.height * 0.231,
                         width: size.height * 0.231,
                        child: widget.imagePath.isNotEmpty &&
                                widget.quantity != 0
                            ? Image.network(
                                widget.imagePath,
                                fit: BoxFit.cover,
                              )
                            : ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors
                                      .grey, // Use grey color for desaturation
                                  BlendMode
                                      .saturation, // Apply saturation blend mode for grayscale effect
                                ),
                                child: Stack(
                                    children: [
                                  Container(
                                    height: size.height * 0.244,
                                    width: size.height * 0.244,
                                    child: widget.imagePath.isEmpty
                                        ? Container(
                                            color: Colors.grey,
                                          )
                                        : Image.network(
                                            widget.imagePath,
                                            fit: BoxFit.contain,
                                          ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Out of Stock',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ]),
                              ),
                      )),
                ),
              ),
              // Positioned(
              //     bottom: 0,
              //     left: 0,
              //     child: Container(
              //       height: size.height * 0.02 + 2,
              //       width: size.width * 0.1 - 2,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(7))),
              //       padding: EdgeInsets.all(4),
              //       child: FittedBox(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               '${widget.numberOfPeopleBought}',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 6),
              //             ),
              //             Icon(
              //               Icons.shopping_bag_outlined,
              //               size: 7,
              //             ),
              //           ],
              //         ),
              //       ),
              //     )),

            ///look at this during the unexpected exception
            Container(
              height: (size.height * 0.381)-(size.height * 0.244),
              color: Colors.grey.shade200,
                // margin: EdgeInsets.only(top: 6),
                 padding: EdgeInsets.only(left: 6, right: 6),
                child: InkWell(
                  onTap: () {
                    Get.to(()=>ProductDisplayScreen(id: widget.id, varid: widget.variationid,));
                  },
                  child: Column(
                    children: <Widget>[

                      Container(
                        alignment: Alignment.centerLeft,
                        height: (size.height * 0.045),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "\₹${widget.nprice}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width*0.04,
                            ),
                            Visibility(
                              visible: widget.nprice < widget.oprice,
                              child: Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "\₹${widget.oprice}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: Color(0xFF343434),

                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width*0.04,
                            ),
                            Visibility(
                              visible: widget.nprice < widget.oprice,
                              child: Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '${widget.discount}\% ' 'off',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerLeft,
                              height: (size.height * 0.038),
                              child: Text(
                                '${widget.title}\n'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: 12, color: Colors.black),
                                maxLines: widget.title.length > 14
                                    ? 2
                                    : 1, // Limit the title to 2 lines (adjust as needed)
                              ),
                            )),
                            // Expanded(
                            //   child: Container(
                            //       alignment: Alignment.centerRight,
                            //       height: (size.height * 0.05),
                            //       child: AddCounter(
                            //         // sizes: widget.sizes,
                            //         id: widget.id,
                            //       )
                            //   ),
                            // )
                          ]),
                      Container(
                          alignment: Alignment.centerLeft,
                          height: (size.height * 0.047),
                          padding: EdgeInsets.only(right: 5),
                          // width: size.width * 0.44,
                          child: Text(
                            '${widget.description}\n',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // Limit the title to 2 lines (adjust as needed)
                          )),

                      // Container(
                      //    alignment: Alignment.centerLeft,
                      //      height: (size.height * 0.045),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: FittedBox(
                      //           fit: BoxFit.scaleDown,
                      //           child: Text(
                      //             "\₹${widget.nprice}",
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w500,
                      //                 fontSize: 13),
                      //             maxLines: 1,
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: size.width*0.04,
                      //       ),
                      //       Visibility(
                      //         visible: widget.nprice < widget.oprice,
                      //         child: Expanded(
                      //           child: FittedBox(
                      //             fit: BoxFit.scaleDown,
                      //             child: Text(
                      //               "\₹${widget.oprice}",
                      //               style: TextStyle(
                      //                 decoration: TextDecoration.lineThrough,
                      //                 fontWeight: FontWeight.w500,
                      //                 fontSize: 11,
                      //                 color: Color(0xFF343434),
                      //
                      //               ),
                      //               maxLines: 1,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: size.width*0.04,
                      //       ),
                      //       Visibility(
                      //         visible: widget.nprice < widget.oprice,
                      //         child: Expanded(
                      //           child: FittedBox(
                      //             fit: BoxFit.scaleDown,
                      //             child: Text(
                      //               '${widget.discount}\% ' 'off',
                      //               style: TextStyle(
                      //                color: Colors.red,
                      //                 fontWeight: FontWeight.w500,
                      //                 fontSize: 12
                      //               ),
                      //               maxLines: 1,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ))
          ]),
        ),
      Positioned(
        top: 0,
        right: 0,
        child: Obx(() {
    bool isFavorite = widget.Fav.favoriteItems.contains(widget.id);
    return IconButton(
    icon: Icon(
    isFavorite ? Icons.favorite : Icons.favorite_border,
    color: isFavorite ? Colors.red : Colors.grey,
    size: 20,
    ),
    onPressed: () {
    isFavorite
    ? widget.Fav.removeFromFavorites(widget.id)
        : widget.Fav.addToFavorites(widget.id);
    },
    );
    })      ),
    ]);
  }
}


// return IconButton(
// icon: Icon(
// isFavorite.value ? Icons.favorite : Icons.favorite_border,
// color: isFavorite.value ? Colors.red : Colors.grey,
// size: 20,
// ),
// onPressed: () {
// // Toggle the favorite status and update the UI
// isFavorite.value = !isFavorite.value;
// // If the item is now a favorite, add it to the favorites subcollection
// if (isFavorite.value) {
// // Add the product to favorites
// widget.Fav.addToFavorites(widget.id); // Assuming productController is your controller instance
// } else {
// // Remove the product from favorites
// widget.Fav.removeFromFavorites(widget.id);
// }
// ;
// });
// }),
// ),
// ]);
// }
// }