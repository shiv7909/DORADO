

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class Product_incre_decre_remo_cart_controller extends GetxController {


  final RxBool isCartEmpty = false.obs;

  void increment_cart(String size, String id,String variation_id) {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Define the product information you want to add to the cart
      String  selectedProductID = id;
      String  variation=variation_id;// Use it directly as an int

      // Reference to the user's cart subcollection
      CollectionReference userCartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      // Check if a document with the same product ID and size already exists in the cart
      userCartRef
          .where('id', isEqualTo: selectedProductID)
          .where('variance_id',isEqualTo: variation)// Use it as an int
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
            'id': selectedProductID,
            'variance_id':variation,
            // Use it as an int
            'size': size, // Include the 'size' field
            'quantity': 1, // Initialize quantity to 1 for a new item
            'Timestamp': FieldValue.serverTimestamp(),
          });
        }
      }).catchError((error) {
        // Handle any errors that occur while checking for existing documents
        print("Error checking for an existing item in the cart: $error");
      });

      // // Dynamically create a field for the selected product in the user's document
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




  void updateUI() {
    update();
  }


  void decrement2_cart(String productId, String size) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference userCartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      userCartRef
          .where('id', isEqualTo: productId)
          .where('size', isEqualTo: size)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.size > 0) {
          // Get the reference to the selected item
          DocumentReference selectedCartItemRef = querySnapshot.docs[0]
              .reference;
          int quantity = querySnapshot.docs[0]['quantity'];

          if (quantity > 1) {
            selectedCartItemRef.update({
              'quantity': FieldValue.increment(-1),
            }).then((_) {
              checkCartEmpty();
              print('Quantity Decremented in Cart');
            }).catchError((error) {
              print('Error Decrementing Quantity in Cart: $error');
            });
          } else {
            // If the quantity is 1, remove the whole document from the cart
            selectedCartItemRef.delete().then((_) {
              checkCartEmpty();
              print('Item Removed from Cart');
            }).catchError((error) {
              print('Error Removing Item from Cart: $error');
            });
          }
        } else {
          print(
              'No matching item found in the cart for productId $productId and size $size');
        }

        updateUI();
      }).catchError((error) {
        print("Error querying cart: $error");
      });
    }
  }




  void remove(String productId, String size) {
    final User? user = FirebaseAuth.instance.currentUser;


    if (user != null) {
      CollectionReference userCartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      userCartRef
          .where('id', isEqualTo: productId)
          .where('size', isEqualTo: size)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.size > 0) {
          // Get the reference to the selected item
          DocumentReference selectedCartItemRef = querySnapshot.docs[0]
              .reference;

          // Remove the whole document from the cart
          selectedCartItemRef.delete().then((_) {
            checkCartEmpty();
            print('Item Removed from Cart');
          }).catchError((error) {
            print('Error Removing Item from Cart: $error');
          });


          updateUI();
        }
      });
    }
  }


  void saveForLater(String size, String id) {
    final User? user = FirebaseAuth.instance.currentUser;



    if (user != null) {
      // Reference to the user's "Saved For Later" subcollection
      CollectionReference userSavedForLaterRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('SavedForLater');

      // Create a new document for the item saved for later
      userSavedForLaterRef.where('id', isEqualTo: id).get().then((snapshot) {
        if (snapshot.docs.isEmpty) {
          // The item is not in Saved For Later, add it
          userSavedForLaterRef.add({
            'id': id,
            'size': size,
            'Timestamp': FieldValue.serverTimestamp(),
          });
          updateUI();
        }
        updateUI();

        // Remove the item from the cart (regardless of quantity)
        removeItemFromCart(id, size);

        // Remove the specific item ID field from the user's document
        removeItemIDFromUserDocument(id);
        checkCartEmpty();
      });
    }
  }


  void removeItemFromCart(String id, String size) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference userCartRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      // Query the cart to find and delete all items with the provided id and size
      userCartRef
          .where('id', isEqualTo: id)
          .where('size', isEqualTo: size)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
        updateUI();
      });
    }
  }


  void removeItemIDFromUserDocument(String id) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('Users').doc(user.uid);

      // Remove the specific item ID field from the user's document
      userDocRef.update({
        '$id': FieldValue.delete(),
      });
    }
    updateUI();
  }



  // This method checks if the cart is empty and updates isCartEmpty accordingly
  void checkCartEmpty() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference cartCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Cart');

      QuerySnapshot cartSnapshot = await cartCollection.get(GetOptions(source: Source.server));

      if (cartSnapshot.docs.isEmpty) {
        isCartEmpty.value = true; // Set isCartEmpty to true if the cart is empty
      } else {
        isCartEmpty.value = false; // Set isCartEmpty to false if there are items in the cart
      }
    }
  }



}


