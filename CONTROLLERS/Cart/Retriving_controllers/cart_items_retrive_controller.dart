


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:untitled1/MODELS/cart_products_model.dart';

class Cart_product_controller extends GetxController {


  final RxList<Product> cartProducts = RxList<Product>();

  // final RxBool hasInvalidData = false.obs;
  final RxBool isCartEmpty = true.obs;

  Future<void> getProductsFromCart() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print('User is not authenticated');
      return;
    }



    final Map<String, Product> productsInCart = {};


    // hasInvalidData.value = false;
    CollectionReference cartCollection = FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('Cart');

    QuerySnapshot cartSnapshot = await cartCollection.get(GetOptions(source: Source.server));

    if (cartSnapshot.docs.isEmpty) {
      print('No products available');
      isCartEmpty.value = true; // Set isCartEmpty to true if the cart is empty
      return;
    } else {
      isCartEmpty.value = false; // Set isCartEmpty to false if there are items
    }

    for (QueryDocumentSnapshot cartDoc in cartSnapshot.docs) {
      final data = cartDoc.data() as Map<String, dynamic>?;

      if (data != null) {
        final productId = data['id']as int?;
        final size = data['size'] as String?;
        final quantity = data['quantity'] as int?;

        if (productId != null && size != null && quantity != null) {
          String productKey = '$productId-$size';

          if (productsInCart.containsKey(productKey)) {
            productsInCart[productKey]!.quantity += quantity;
          } else {
            Query productQuery = FirebaseFirestore.instance
                .collection('products')
                .where('id', isEqualTo: productId);
            QuerySnapshot productQuerySnapshot = await productQuery.get();
            if (productQuerySnapshot.docs.isNotEmpty) {
              DocumentSnapshot productSnapshot = productQuerySnapshot.docs.first;
              final productDetails = productSnapshot.data() as Map<String, dynamic>;

              final sizesQuerySnapshot =
              await productSnapshot.reference.collection('Sizes').get();

              final sizesAvailableItems = sizesQuerySnapshot.docs.fold<Map<String, int>>(
                {},
                    (previousValue, sizeDoc) {
                  final sizeData = sizeDoc.data();
                  final size = sizeData['size'] as String?;
                  if (size != null) {
                    previousValue[size] = sizeData['availableItems'] ?? 0;
                  } else {
                    print('Missing or invalid size data in Firestore document: $sizeData');
                  }
                  return previousValue;
                },
              );

              final product = Product(
                id: _parseInteger(productDetails['id']),
                title: productDetails['title'] ?? '',
                description: productDetails['description'] ?? '',
                oprice: _parseInteger(productDetails['oprice']),
                nprice: _parseInteger(productDetails['nprice']),
                discount: _parseInteger(productDetails['discount']),
                quantity: quantity,
                size: size,
                sizesAvailableItems: sizesAvailableItems,
              );

              if (product.sizesAvailableItems.containsKey(size) &&
                  product.sizesAvailableItems[size]! >= product.quantity) {
                product.stockExists = true;
                print('Stock exists for Product ID ${product.id}');
                product.stock = product.sizesAvailableItems[size]!;
              } else {
                product.stockExists = false;
                print('Stock unavailable for Product ID ${product.id}');
              }

              final imageQuerySnapshot =
              await productSnapshot.reference.collection('product_images').get();

              if (imageQuerySnapshot.docs.isNotEmpty) {
                final firstImageDoc = imageQuerySnapshot.docs.first;
                product.image = firstImageDoc['imagePath'] as String? ?? '';
              }
              else {
                print('Missing or invalid image data in Firestore document: $productSnapshot');
              }
              productsInCart[productKey] = product;
            } else {
              print('Product Document Not Found for Product ID $productId');
            }
          }

        } else {
          // hasInvalidData.value = true;
          print('Invalid or missing data in Firestore document: $data');
        }
      } else {
        print('No data found in Firestore document: $cartDoc');
      }
    }

    final List<Product> cartProductsList = [];
    productsInCart.forEach((productKey, product) {
      cartProductsList.add(product);
    });

    cartProducts.assignAll(cartProductsList);
  }

  void printProductDetails(Product product) {
    print('Product ID: ${product.id}');
    print('Image Link: ${product.image}');
    print('Title: ${product.title}');
    print('Description: ${product.description}');
    print('Original Price: ${product.oprice}');
    print('New Price: ${product.nprice}');
    print('Discount: ${product.discount}');
    print('Size_in_cart: ${product.size}');
    print('Quantity in Cart: ${product.quantity}');
    print('Stock Exists: ${product.stockExists ? 'Yes' : 'No'}');
    print('Sizes and Available Items:');
    product.sizesAvailableItems.forEach((size, availableItems) {
      print('  Size: $size');
      print('  Available Items: $availableItems');
    });
    print('\n');
  }

  static int _parseInteger(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String && value.isNotEmpty) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }
}

