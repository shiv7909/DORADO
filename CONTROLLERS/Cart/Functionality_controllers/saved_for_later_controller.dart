



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Saved_for_later extends GetxController {


  void updateUI() {
    update();
  }


  // void saveForLater(String size, int id) {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //
  //
  //
  //   if (user != null) {
  //     // Reference to the user's "Saved For Later" subcollection
  //     CollectionReference userSavedForLaterRef = FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(user.uid)
  //         .collection('SavedForLater');
  //
  //     // Create a new document for the item saved for later
  //     userSavedForLaterRef.where('id', isEqualTo: id).get().then((snapshot) {
  //       if (snapshot.docs.isEmpty) {
  //         // The item is not in Saved For Later, add it
  //         userSavedForLaterRef.add({
  //           'id': id,
  //           'size': size,
  //           'Timestamp': FieldValue.serverTimestamp(),
  //         });
  //         updateUI();
  //       }
  //       updateUI();
  //
  //       // Remove the item from the cart (regardless of quantity)
  //       removeItemFromCart(id, size);
  //
  //       // Remove the specific item ID field from the user's document
  //       removeItemIDFromUserDocument(id);
  //     });
  //   }
  // }
  //
  //
  // void removeItemFromCart(int id, String size) {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     CollectionReference userCartRef = FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(user.uid)
  //         .collection('Cart');
  //
  //     // Query the cart to find and delete all items with the provided id and size
  //     userCartRef
  //         .where('id', isEqualTo: id)
  //         .where('size', isEqualTo: size)
  //         .get()
  //         .then((querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //         doc.reference.delete();
  //       });
  //       updateUI();
  //     });
  //   }
  // }
  //
  //
  // void removeItemIDFromUserDocument(int id) {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     DocumentReference userDocRef =
  //     FirebaseFirestore.instance.collection('Users').doc(user.uid);
  //
  //     // Remove the specific item ID field from the user's document
  //     userDocRef.update({
  //       '$id': FieldValue.delete(),
  //     });
  //   }
  //   updateUI();
  // }

      void removeItemFrom_saveForLater(int id, String size) {
        final User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          CollectionReference userCartRef = FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .collection('SavedForLater');

          // Query the cart to find the item with the provided id and size
          userCartRef
              .where('id', isEqualTo: id)
              .where('size', isEqualTo: size)
              .get()
              .then((querySnapshot) {
            querySnapshot.docs.forEach((doc) {
              // Delete each matching document in the cart
              doc.reference.delete();
            });
          });
        }
        updateUI();
      }

    }

