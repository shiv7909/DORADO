
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../MODELS/All_home_carousel_model.dart';

class carouselController {
  final FirebaseFirestore _firestore;

  carouselController({required FirebaseFirestore firestore}) : _firestore = firestore;

  Future<CarouselModel> getCarouselData() async {
    List<String> urls = [];
    List<String> links = [];

    // Fetch image URLs from Firestore and populate the urls list
    await _firestore.collection('carousel_images').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final Map<String, dynamic>? data = doc.data();

        if (data == null) {
          CircularProgressIndicator();
        }
        else{
          urls.add(data['image_url'] as String);
        }
      });
    });

    // Fetch links from Firestore and populate the links list
    await _firestore.collection('homepage_carousel_links').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final Map<String, dynamic>? data = doc.data().cast<String, dynamic>();
        if (data != null) {
          links.add(data['homepage_link_url']);
        }
      });
    });

    return CarouselModel(imageUrls: urls, imageLinks: links);
  }
}
