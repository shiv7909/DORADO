// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// //  class Header extends StatefulWidget {
// //
// //   @override
// //   State<Header> createState() => _HeaderState();
// // }
// //
// // class _HeaderState extends State<Header> {
// //   Future<String> _getCurrentImageUrl() async {
// //     try {
// //       // Replace 'announcement' and 'documentId' with your Firestore collection and document ID
// //       final DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('logo').doc('YyN2LhFoGMXh0tUZ3Kud').get();
// //       if (snapshot.exists) {
// //         final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
// //         /// we have another code like it goes when we are storing image in
// //         /// the firestore but  we are storing the imageurl so we have to
// //         /// use like Map<String,dynamic>....
// //         final String imageurl = data['imageurl'];
// //         return imageurl;
// //       } else {
// //         return 'we are working on the servers ⛏️'; // Handle the case where no URL is found.
// //       }
// //     } catch (e) {
// //       print('');
// //       return ''; // Handle errors
// //     }
// //   }
// //    Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return FutureBuilder<String>(
// //       future: _getCurrentImageUrl(),
// //       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
// //         if (snapshot.connectionState== ConnectionState.waiting)
// //           {
// //             return Container(
// //               height: 50,
// //              margin: EdgeInsets.only(bottom: 6),
// //               decoration: BoxDecoration(
// //                 borderRadius:
// //                   BorderRadius.circular(50),
// //                 color: Colors.grey.shade300,
// //               ),
// //             );
// //           }
// //         else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
// //           return Text('Error loading image');
// //         }
// //         else {
// //           return Container(
// //
// //              margin: EdgeInsets.only(top:4,bottom: 2),
// //             //it will cover the 20%  of the total height
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: <Widget>[
// //                       // Container(
// //                       //   padding: EdgeInsets.only(left: 5),
// //                       //   margin: EdgeInsets.only(left: 20),
// //                       //   child:
// //                       //   Text(
// //                       //     "THE_ORIGINALS",
// //                       //     style: TextStyle(color: Colors.black87,
// //                       //       fontWeight: FontWeight.bold,
// //                       //       fontFamily: "SFPro",
// //                       //       fontSize: 18,
// //                       //     ),),
// //                       // ),
// //                       Container(
// //                          padding: EdgeInsets.all(5),
// //
// //                           child: Image.network(snapshot.data!,fit: BoxFit.fill,),
// //                         //height: size.height*0.06,
// //                         height: 48,
// //                         width:size.width/4,
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //         }
// //       },
// //
// //     );
// //    }
// // }
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Header extends StatefulWidget {
//   @override
//   State<Header> createState() => _HeaderState();
// }
//
// class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   bool _isImageLoaded = false; // Track if the image is loaded
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 2), // Adjust the duration as needed
//       vsync: this,
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(-0.5, 0.0),
//       end: Offset(0.0, 0.0),
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.bounceIn,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//
//   Future<String> _getCurrentImageUrl() async {
//     try {
//       // Replace 'announcement' and 'documentId' with your Firestore collection and document ID
//       final DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('logo').doc('YyN2LhFoGMXh0tUZ3Kud').get();
//       if (snapshot.exists) {
//         final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//         /// we have another code like it goes when we are storing image in
//         /// the firestore but  we are storing the imageurl so we have to
//         /// use like Map<String,dynamic>....
//         final String imageurl = data['imageurl'];
//         return imageurl;
//       } else {
//         return 'we are working on the servers ⛏️'; // Handle the case where no URL is found.
//       }
//     } catch (e) {
//       print('');
//       return ''; // Handle errors
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return FutureBuilder<String>(
//       future: _getCurrentImageUrl(),
//       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Image is still loading
//           return Container(
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               // color: Colors.grey.shade300,
//             ),
//           );
//         } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
//           // Error loading image
//           return Text('');
//         } else {
//           // Image has loaded
//           if (!_isImageLoaded) {
//             _isImageLoaded = true; // Mark image as loaded
//             _animationController.forward(); // Start the animation
//           }
//
//           return Container(
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.end
//               children: <Widget>[
//                 SlideTransition(
//                   position: _slideAnimation,
//                   child: Container(
//                     height: 50,
//                     child: Image.network(
//                       snapshot.data!,
//                       fit: BoxFit.fill,
//                       // color: Colors.white,
//                     ),
//                     width: size.width / 4,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }
//
