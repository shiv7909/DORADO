


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Title_retriever extends GetxController {
  final Map<String, PageTitle> titles = {};

  Future<String> fetchTitle(String documentId) async {
    try {
      final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('Titles').doc(documentId).get();
      if (snapshot.exists) {
        final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        titles[documentId] = PageTitle.fromJson(data);
        return titles[documentId]?.title ?? '';
      }
      else {
        return '    ';
      }
    } catch (e) {
      print('Error fetching title: $e');
      return '';
    }
  }
}

class PageTitle {
  final String title;

  PageTitle({
    required this.title,
  });

  factory PageTitle.fromJson(Map<String, dynamic> json) {
    return PageTitle(
      title: json['title'] ?? '',
    );
  }
}