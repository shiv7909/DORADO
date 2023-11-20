


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController{


  void updateUI() {
    update();
  }


  Future<void> addToFavorites(int productId) async {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the user's favorites subcollection
      CollectionReference favoritesRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Favorites');

      // Check if the item is already in favorites
      QuerySnapshot<Object?> existingFavorites =
      await favoritesRef.where('id', isEqualTo: productId.toString()).get();

      if (existingFavorites.docs.isEmpty) {
        // The item is not in favorites, so add it
        await favoritesRef.add({
          'id': productId.toString(),
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Update the UI or perform any other actions as needed
        updateUI();
      }
    }
  }

  Future<void> removeFromFavorites(int productId) async {
    // Get the current user
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the user's favorites subcollection
      CollectionReference favoritesRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Favorites');

      // Check if the item is in favorites
      QuerySnapshot<Object?> matchingFavorites =
      await favoritesRef.where('id', isEqualTo: productId.toString()).get();

      if (matchingFavorites.docs.isNotEmpty) {
        // Remove the matching item from favorites
        await matchingFavorites.docs[0].reference.delete();

        // Update the UI or perform any other actions as needed
        updateUI();
      }
    }
  }


}