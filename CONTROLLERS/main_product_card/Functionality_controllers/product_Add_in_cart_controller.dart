

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class Product_Add_controller extends GetxController {




  void increment_cart(String size, int id) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Define the product information you want to add to the cart
      int selectedProductID = id; // Use it directly as an int

      // Reference to the user's cart subcollection
      CollectionReference userCartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      // Check if a document with the same product ID and size already exists in the cart
      userCartRef
          .where('id', isEqualTo: selectedProductID) // Use it as an int
          .where('size', isEqualTo: size) // Include the 'size' field
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // If a matching document exists, update the quantity
          DocumentSnapshot existingDoc = querySnapshot.docs.first;
          int currentQuantity = existingDoc['quantity'] ?? 0;
          DocumentReference existingDocRef = existingDoc.reference;
          existingDocRef.update({
            'quantity': FieldValue.increment(1), // Increment the quantity field
            'Timestamp': FieldValue.serverTimestamp(),
          });
        } else {
          // If no matching document exists, create a new document
          userCartRef.add({
            'id': selectedProductID, // Use it as an int
            'size': size, // Include the 'size' field
            'quantity': 1, // Initialize quantity to 1 for a new item
            'Timestamp': FieldValue.serverTimestamp(),
          });
        }
      }).catchError((error) {
        // Handle any errors that occur while checking for existing documents
        print("Error checking for an existing item in the cart: $error");
      });

      // Dynamically create a field for the selected product in the user's document
      // DocumentReference userDocRef =
      // FirebaseFirestore.instance.collection('Users').doc(user.uid);
      // userDocRef.update({
      //   '$selectedProductID': FieldValue.increment(1),
      // }).catchError((error) {
      //   // Handle any errors that occur while updating the user's document
      //   print("Error updating the user's document: $error");
      // });

      updateUI();
    }
  }


  // void decrement_cart(int productId) {
  //   // Get the current user
  //   final User? user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     // Reference to the user's cart subcollection
  //     CollectionReference userCartRef = FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(user.uid)
  //         .collection('Cart');
  //
  //     // Reference to the user's document
  //     DocumentReference userDocRef = FirebaseFirestore.instance.collection('Users').doc(user.uid);
  //
  //     // Start a batch to ensure atomic updates
  //     WriteBatch batch = FirebaseFirestore.instance.batch();
  //
  //     userCartRef
  //         .where('id', isEqualTo: productId)
  //         .orderBy('Timestamp', descending: true)
  //         .limit(1)
  //         .get()
  //         .then((querySnapshot) {
  //       if (querySnapshot.size > 0) {
  //         DocumentReference selectedCartItemRef = querySnapshot.docs[0].reference;
  //         int quantity = querySnapshot.docs[0]['quantity'];
  //
  //         if (quantity > 1) {
  //           // Decrement the quantity in the cart
  //           batch.update(selectedCartItemRef, {
  //             'quantity': FieldValue.increment(-1),
  //           });
  //         } else {
  //           // Remove the item from the cart
  //           batch.delete(selectedCartItemRef);
  //         }
  //
  //         // Check if the product count in the user's document is greater than 0
  //         if (quantity > 0) {
  //           batch.update(userDocRef, {
  //             '$productId': FieldValue.increment(-1),
  //           });
  //         } else {
  //           print('Count not decremented because it is already 0');
  //         }
  //
  //         // Commit the batch
  //         batch.commit().then((_) {
  //           print('Cart and User Document Updated');
  //           updateUI(); // Update the UI or perform any other actions
  //         }).catchError((error) {
  //           print('Error updating Cart and User Document: $error');
  //         });
  //       }
  //     }).catchError((error) {
  //       print("Error querying cart: $error");
  //     });
  //   }
  // }


  void updateUI() {
    update();
  }
}

