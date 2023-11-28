// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:story_view/controller/story_controller.dart';
// import 'package:story_view/widgets/story_view.dart';
//
// import '../../Other_homes.dart';
//
//
//
//
//
// class Home_stories extends StatefulWidget {
//   @override
//   State<Home_stories> createState() => _State();
// }
//
// class _State extends State<Home_stories> {
//   // Simulate the data fetched from Firebase
//
//   final StoryController controller = StoryController();
//
//
//   List<Map<String, dynamic>> imageData = [
//
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 002839.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/2jJM3dTeE18xpySS3t/giphy.gif',
//         'https://media.giphy.com/media/2jJM3dTeE18xpySS3t/giphy.gif',
//       ],
//     },
//
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 002839.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/SvRagztowBmk6BvT9Z/giphy.gif',
//       ],
//     },
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 002839.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/2jJM3dTeE18xpySS3t/giphy.gif',
//         'https://media.giphy.com/media/2jJM3dTeE18xpySS3t/giphy.gif',
//       ],
//     },
//
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 002839.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/SvRagztowBmk6BvT9Z/giphy.gif',
//       ],
//     },
//
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 170429.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/SvRagztowBmk6BvT9Z/giphy.gif',
//       ],
//     },
//
//
//     {
//       'imageUrl': 'assists/images/Screenshot 2023-11-08 170429.png',
//       'storyUrls': [
//         'https://media.giphy.com/media/SvRagztowBmk6BvT9Z/giphy.gif',
//       ],
//     },
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Container(
//       margin: EdgeInsets.only(top: 20,bottom: 7),
//       // alignment: Alignment.center,
//        padding: EdgeInsets.only(bottom: 5,top: 5),
//        // color: Colors.orange,
//       height: size.height * 0.092,
//       width: size.width,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageData.length,
//         itemBuilder: (context, index) {
//
//           final imageUrl = imageData[index]['imageUrl'];
//           final storyUrls = imageData[index]['storyUrls'];
//
//           return GestureDetector(
//             onTap: () {
//               final stories = storyUrls.map((url) {
//                 return StoryItem.pageImage(
//                   url: url,
//                   controller: controller,
//                 );
//               }).toList();
//
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => Home11(
//                   stories: stories.cast<StoryItem>().toList(), // Cast the List<dynamic> to List<StoryItem>
//                 ),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(14)),
//                 image: DecorationImage(image: AssetImage(imageUrl),fit: BoxFit.cover)
//               ),
//               alignment: Alignment.center,
//               width: size.width*0.18,
//               margin: EdgeInsets.only(left: 15,right: 5),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//
// class Home11 extends StatelessWidget {
//   final StoryController controller = StoryController();
//   final List<StoryItem> stories; // List of stories
//
//   Home11({required this.stories}); // Constructor to accept stories
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Stack(
//                   children: [
//                     StoryView(
//                       controller: controller,
//                       storyItems: stories, // Use the provided stories
//                       onStoryShow: (s) {
//                       },
//                       onComplete: () {
//                         Get.back();
//                       },
//                       progressPosition: ProgressPosition.top,
//                       repeat: false,
//                       inline: true,
//                     ),
//                     Positioned(
//                       bottom: 20,
//                       right: 20,
//                       child: GestureDetector(
//                         onTap: (){
//                           Get.to(()=>navigated_Home(index: 0));
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(10),
//                           height: size.height * 0.05,
//                           width: size.width * 0.3,
//
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             color: Colors.white,
//                           ),
//                           child: FittedBox(
//                             child: Text(
//                               'Shop now',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 20,
//                       left: 10,
//                       child: CircleAvatar(
//                         radius: size.width * 0.07,
//                         backgroundColor: Colors.black,
//                         child: Text(
//                           'DO',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
