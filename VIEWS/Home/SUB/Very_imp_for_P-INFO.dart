//
// class VideoPlayerScreen extends StatefulWidget {
//   final String Category;
//   VideoPlayerScreen({required this.Category});
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   final announcementController = Get.find<AnnouncementController>();
//   late String documentId = widget.Category;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return FutureBuilder<List<String>?>(
//       future: announcementController.getCurrentImageUrls(documentId),
//       builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               height: ((size.height * 0.1) - 40),
//               width: size.width,
//               margin: EdgeInsets.only(left: 5, right: 5, top: 5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.grey.shade300,
//               ),
//             ),
//           );
//         } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//           return Container();
//         } else {
//           // Assuming you want to create a list of Image widgets for each URL
//           List<Widget> imageWidgets = snapshot.data!
//               .map((imageUrl) => Image.network(imageUrl, fit: BoxFit.cover))
//               .toList();
//
//           return Container(
//             child: Stack(
//               children: [
//                 Container(
//                   color: Colors.white,
//                   height: size.height * 0.7,
//                   width: size.width * 1,
//                   margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
//                   child: Stack(
//                     children: [
//                       PageView(
//                         children: imageWidgets,
//                       ),
//                       Positioned(
//                         bottom: 20,
//                         right: 20,
//                         child: Column(
//                           children: [
//                             Container(
//                               width: size.width * 0.3,
//                               height: size.height * 0.05,
//                               color: Colors.white,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Shop now',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
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
