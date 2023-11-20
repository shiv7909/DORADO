import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';


class Announcement1 extends StatefulWidget {
  @override
  State<Announcement1> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement1> {

  Future<String> _getCurrentImageUrl() async {
    try {
      // Replace 'announcement' and 'documentId' with your Firestore collection and document ID
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('announcement').doc('nIyL1HgXcQQZgBroZHEl').get();
      if (snapshot.exists) {
        final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        /// we have another code like it goes when we are storing image in
        /// the firestore but  we are storing the imageurl so we have to
        /// use like Map<String,dynamic>....
        final String imageurl = data['imageurl2'];
        return imageurl;
      } else {
        return 'we are working on the servers ⛏️'; // Handle the case where no URL is found.
      }
    } catch (e) {
      print('');
      return ''; // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<String>(
      future: _getCurrentImageUrl(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
              baseColor: Colors.grey[300]!, // Adjust the base and highlight colors
              highlightColor: Colors.grey[100]!,
              child: Container(
            height: ((size.height * 0.1)-5),
            width: size.width,
            margin: EdgeInsets.only(left: 10,right: 10,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade300,
            ),
              )
          );
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return Text('Error loading image');
        } else {
          return Container(
            height: size.height * 0.1+15,
            width: size.width,
            margin: EdgeInsets.only(right: 10,left: 10,top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(snapshot.data!,fit: BoxFit.fill,), // Use the retrieved image URL
            ),
          );
        }
      },
    );
  }
}
