
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../MODELS/navi_panel.dart';

// class Navigation_1_Controller {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<List<NavigationItem1>> fetchNavigationItems() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('NavigationItem1').get();
//
//       return querySnapshot.docs.map((doc) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         return NavigationItem1(
//           iconpath: data['iconpath'],
//           name: data['name'],
//         );
//       }).toList();
//     } catch (e) {
//       // Handle errors here
//       print(e.toString());
//       return [];
//     }
//   }
// }

class NavigationController extends GetxController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isLoading = true.obs; // Define isLoading as a reactive boolean
  RxBool hasError = false.obs; // Define hasError as a reactive boolean
  RxString error = ''.obs; // Define error as a reactive string
  RxList<NavigationItem1> navigationItems = <NavigationItem1>[].obs;

  Future<void> fetchNavigationItems() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      QuerySnapshot querySnapshot = await _firestore.collection('Navigation_panel').get();

      // Assuming you have a specific document ID, change 'your_document_id' accordingly
      DocumentReference documentReference = _firestore.collection('Navigation_panel').doc('navigation_panels');
      QuerySnapshot subcollectionSnapshot = await documentReference.collection('Search_navigation').get();

      navigationItems.value = subcollectionSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print("heloooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
        return NavigationItem1(
          iconpath: data['iconpath'],
          name: data['name'],
        );
      }).toList();

      isLoading.value = false;
    } catch (e) {
      // Handle errors here
      isLoading.value = false;
      hasError.value = true;
      error.value = e.toString();
    }
  }
}

