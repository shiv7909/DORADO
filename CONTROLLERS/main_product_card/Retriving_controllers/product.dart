


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/MODELS/product.dart';


class ProductController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMsg = ''.obs;


  Future<void> fetchProductsFromPanel(String panelId) async {
    try {
      products.clear();
      final panelsCollection = FirebaseFirestore.instance.collection('panels');
      final panelDocRef = panelsCollection.doc(panelId);
      final panelDocSnapshot = await panelDocRef.get();

      final productMaps = panelDocSnapshot['products'] as List<dynamic>;

      await Future.forEach(productMaps, (productMap) async {
        final productId = productMap['id'] as String;
        final variationId = productMap['variation'] as String;

        await findProductDocument(productId, variationId);
      });
    } catch (error) {
      print('Error fetching products from panel: $error');
      // Handle errors
    }
  }


  Future<void> findProductDocument(String productId, String variationId) async {
    try {
      final parts = productId.split('-');
      final gender = parts[0][0] == '1' ? 'Men' : 'Women';
      print(parts[0]);
      print(parts[1]);
      print(parts[2]);
      print(parts[3]);
      final categoryCode = parts[1];
      String documentCode=parts[2];
      String category=parts[3];

      switch (categoryCode) {
        case '21':
          category = 'Footwear';
          switch (parts[2]) {
            case '001':
              documentCode = 'Casual';
              break;
            case '002':
              documentCode = 'Running';
              break;
            case '003':
              documentCode = 'Sliders';
              break;
            case '004':
              documentCode = 'Sneakers';
              break;
            default:
            // Handle unknown document code for footwear
              break;
          }
          break;


        case '22':
          category = 'Overlays';
          switch (parts[2]) {
            case '001':
              documentCode = 'Hoodies';
              break;
            case '002':
              documentCode = 'Jackets';
              break;
            case '003':
              documentCode = 'Sweatshirts';
              break;
          // Add cases for other overlay subcategories if needed
            default:
            // Handle unknown document code for overlays
              break;
          }
          break;


        case '24':
          category = 'Pants';
          switch (parts[2]) {
            case '001':
              documentCode = 'Cargo';
              break;
            case '002':
              documentCode = 'Formal';
              break;
            case '003':
              documentCode = 'Jeans';
              break;
            case '004':
              documentCode = 'Joggers';
              break;
            default:
            // Handle unknown document code for footwear
              break;
          }
          break;


        case '25':
          category = 'Shirts';
          switch (parts[2]) {
            case '001':
              documentCode = 'Checks';
              break;
            case '002':
              documentCode = 'Oversize';
              break;
            case '003':
              documentCode = 'Overshirt';
              break;
            case '004':
              documentCode = 'Plain';
              break;
            default:
            // Handle unknown document code for footwear
              break;
          }
          break;


        case '23':
          category = 'Tshirts';
          switch (parts[2]) {
            case '001':
              documentCode = 'Basic';
              break;
            case '002':
              documentCode = 'Graphic';
              break;
            case '003':
              documentCode = 'Oversize';
              break;
            case '004':
              documentCode = 'Polo';
              break;
            default:
            // Handle unknown document code for footwear
              break;
          }
          break;
        default:
          break;
      }

      final productDocRef = FirebaseFirestore.instance
          .collection('Total_Products')
          .doc(gender)
          .collection(category)
          .doc(documentCode)
          .collection('products')
          .doc(productId); // Directly access the document using productId as the document ID

      final productDocSnapshot = await productDocRef.get();

      if (productDocSnapshot.exists) {
        print('product exists');
        print('product exists');
        print('product exists');
        print('product exists');
        print('product exists');
        print('product exists');

        final productData = productDocSnapshot.data() as Map<String, dynamic>;

        final id = productData['id'] ?? '';
        final title = productData['Title'] ?? '';
        final description = productData['Description'] ?? '';
        final noOfVariations = productData['No_of_Variations'] ?? 0;
       // Check for the exact field name

        final variationRef = productDocRef.collection('variations').doc(variationId);

        final variationDocSnapshot = await variationRef.get();

        if (variationDocSnapshot.exists) {
          final variationData = variationDocSnapshot.data() as Map<String, dynamic>;

          final oprice = variationData['oprice'] ?? 0;
          final nprice = variationData['nprice'] ?? 0;
          final color = variationData['color'] ?? '';
          final discount = variationData['discount'] ?? 0;
          final image = variationData['image'] ?? ''; // Assuming image is a single string URL
          final quantity = variationData['Quantity'] ?? 0;


          final product = Product(
            id: id,
            No_of_Variations: noOfVariations,
            oprice: oprice,
            nprice: nprice,
            discount: discount,
            color: color,
            imagepath: image,
            Quantity: quantity,
            Title:title,
            Description: description,
            variationid: variationId,
          );

          products.add(product);
          printProductDetails(product);
          isLoading.value = false;
        } else {
          print('Variation document not found');
        }
      } else {
        print('Product document not found');
      }
    }
    catch (error) {
      print('Error finding product document: $error');
      // Handle errors
    }
  }
}

void printProductDetails(Product product) {
  print('Product ID: ${product.id}');
  print('Title: ${product.Title}');
  print('Description: ${product.Description}');
  print('No. of Variations: ${product.No_of_Variations}');
  print('OPrice: ${product.oprice}');
  print('NPrice: ${product.nprice}');
  print('Discount: ${product.discount}');
  print('Color: ${product.color}');
  print('Image Path: ${product.imagepath}');
  print('Quantity: ${product.Quantity}');
  print('----------------------------------------');
}