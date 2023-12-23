// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// import '../../../MODELS/cart_products_model.dart';
//
// class SavedForLaterController extends GetxController {
//
//
//   final RxList<CartProduct> savedForLaterProducts = RxList<CartProduct>();
//
//   final RxBool isCartEmpty = true.obs;
//
//   Future<void> getSavedForLaterProducts() async {
//     final User? user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       print('User is not authenticated');
//       return;
//     }
//
//     CollectionReference savedForLaterCollection = FirebaseFirestore.instance
//         .collection('Users')
//         .doc(user.uid)
//         .collection('SavedForLater');
//
//     QuerySnapshot savedForLaterSnapshot =
//     await savedForLaterCollection.get(GetOptions(source: Source.server));
//
//     if (savedForLaterSnapshot.docs.isEmpty) {
//       print('No products available');
//       isCartEmpty.value = true; // Set isCartEmpty to true if the cart is empty
//       return;
//     } else {
//       isCartEmpty.value = false; // Set isCartEmpty to false if there are items
//     }
//
//     final List<CartProduct> savedForLaterList = [];
//
//     for (QueryDocumentSnapshot savedForLaterDoc in savedForLaterSnapshot.docs) {
//       final data = savedForLaterDoc.data() as Map<String, dynamic>?;
//
//       if (data != null) {
//         final productId = data['id'] as int;
//         final size = data['size'] as String;
//
//         // Fetch product details from the "Products" collection
//         final product = await fetchProductDetails(productId, size);
//
//         if (product != null) {
//           savedForLaterList.add(product);
//           print('yoooooooo you  have produts');
//         }
//       } else {
//         print('Invalid or missing data in Firestore document: $data');
//       }
//     }
//
//     savedForLaterProducts.assignAll(savedForLaterList);
//     print('Saved for later products: $savedForLaterProducts');
//   }
//
//   Future<CartProduct?> fetchProductDetails(int productId, String size) async {
//     CollectionReference productsCollection =
//     FirebaseFirestore.instance.collection('products');
//
//     Query productQuery = productsCollection.where('id', isEqualTo: productId);
//     QuerySnapshot productQuerySnapshot = await productQuery.get();
//
//     if (productQuerySnapshot.docs.isNotEmpty) {
//       DocumentSnapshot productSnapshot = productQuerySnapshot.docs.first;
//       final productDetails = productSnapshot.data() as Map<String, dynamic>;
//
//       final product = CartProduct(
//         id: _parseInteger(productDetails['id']),
//         title: productDetails['title'] ?? '',
//         description: productDetails['description'] ?? '',
//         oprice: _parseInteger(productDetails['oprice']),
//         nprice: _parseInteger(productDetails['nprice']),
//         discount: _parseInteger(productDetails['discount']),
//         size: size, // Use the size from SavedForLater
//       );
//
//       // Fetch the first image for the product
//       final imageQuerySnapshot =
//       await productSnapshot.reference.collection('product_images').get();
//       if (imageQuerySnapshot.docs.isNotEmpty) {
//         final firstImageDoc = imageQuerySnapshot.docs.first;
//         product.imagepath = firstImageDoc['imagePath'] as String? ?? '';
//       } else {
//         print('Missing or invalid image data for Product ID $productId');
//       }
//
//       return product;
//     } else {
//       print('Product Document Not Found for Product ID $productId');
//       return null;
//     }
//   }
//
//   static int _parseInteger(dynamic value) {
//     if (value is int) {
//       return value;
//     } else if (value is String && value.isNotEmpty) {
//       return int.tryParse(value) ?? 0;
//     } else {
//       return 0;
//     }
//   }
//
// }
