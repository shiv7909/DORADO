


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../MODELS/QuoteModel.dart';

class QuoteController extends GetxController {
  final CollectionReference cartIconCollection =
  FirebaseFirestore.instance.collection('Quotes');

  Future<Quotemodel?> getQuote(String documentId) async {
    final documentSnapshot = await cartIconCollection.doc(documentId).get();
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      return Quotemodel.fromMap(data);
    }
    return null; // Document doesn't exist
  }
}


