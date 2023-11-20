

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:untitled1/MODELS/product.dart';



class ProductController extends GetxController {


  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMsg = ''.obs;
  final RxInt count_in_cart = 0.obs;

  final Map<String, int> productCountCache = {};


  Future<void> fetchProducts() async {
    try {
      isLoading.value = true; // Set loading to true while fetching data
       final User? user = FirebaseAuth.instance.currentUser;

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection("products").get();

      if (querySnapshot.docs.isNotEmpty) {
        final List<Product> productList = [];

        for (final doc in querySnapshot.docs) {
          final QuerySnapshot<Map<String, dynamic>> sizeSnapshot =
          await doc.reference.collection("Sizes").get();

          final List<SizeDetails> sizeList = sizeSnapshot.docs
              .map((sizeDoc) => SizeDetails.fromMap(sizeDoc.data()))
              .toList();

          // Fetch image URLs from the product_images subcollection
          final List<String> imageUrls = await fetchImageUrls(doc.reference);

          final product = Product.fromFirestore(doc.data(), sizeList, imageUrls);


          productList.add(product);
        }

        products.assignAll(productList);
      }

      isLoading.value = false; // Set loading to false after fetching data
    } catch (e, stackTrace) {
      isLoading.value = false;
      hasError.value = true;
      errorMsg.value = 'Error fetching products: $e';
      print('Error fetching products: $e\n$stackTrace');
    }
  }

  Future<List<String>> fetchImageUrls(DocumentReference productReference) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> imageUrlsSnapshot =
      await productReference.collection("product_images").get();

      final List<String> imageUrls = imageUrlsSnapshot.docs
          .map((imageDoc) => imageDoc.data()['imagePath'] as String)
          .toList();

      return imageUrls;
    } catch (e) {
      print('Error fetching imageUrls: $e');
      return []; // Return an empty list in case of an error
    }
  }




  void updateUI() {
    update();
  }

}

