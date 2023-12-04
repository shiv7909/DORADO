



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';



class AnnouncementController extends GetxController {
  Future<List<AnnouncementData>?> getCurrentImageData(String DocumentId, String Subcollection) async {
    try {
      final QuerySnapshot subcollectionSnapshot = await FirebaseFirestore.instance
          .collection('announcement')
          .doc(DocumentId)
          .collection(Subcollection)
          .get();

      if (subcollectionSnapshot.docs.isNotEmpty) {
        List<AnnouncementData> dataList = subcollectionSnapshot.docs
            .map((doc) => AnnouncementData(
          imageUrl: doc['imageurl'] as String,
          name: doc['name'] as String,
          id: doc['id'] as int ,
        ))

            .toList();
        print("--------------------------------------------------------------------------------------");
        return dataList;

      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

// class AnnouncementController extends GetxController {
//
//   Future<List<Map<String, dynamic>>?> getCurrentImageData(String DocumentId, String Subcollection) async {
//     try {
//       final QuerySnapshot subcollectionSnapshot = await FirebaseFirestore.instance
//           .collection('announcement')
//           .doc(DocumentId)
//           .collection(Subcollection)
//           .get();
//
//       if (subcollectionSnapshot.docs.isNotEmpty) {
//         // Iterate through documents and retrieve the required fields
//         List<Map<String, dynamic>> imageInfoList = subcollectionSnapshot.docs
//             .map((doc) {
//           final int id = doc['id'] as int;
//           final String name = doc['name'] as String;
//           final String imageUrl = doc['imageurl'] as String;
//           return {
//             'id': id,
//             'name': name,
//             'imageurl': imageUrl,
//           };
//         })
//             .toList();
//         return imageInfoList;
//       } else {
//         return null; // Return an empty list if the subcollection is empty.
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null; // Return an empty list for errors
//     }
//   }
// }

class AnnouncementData {
  final int id;
  final String name;
  final String imageUrl;

  AnnouncementData({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}