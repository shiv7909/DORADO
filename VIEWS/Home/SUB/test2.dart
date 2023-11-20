import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../CONTROLLERS/anncoucement_controller.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String Category;
  final String Subcollection;
  VideoPlayerScreen({required this.Category,
  required this.Subcollection});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final announcementController = Get.find<AnnouncementController>();
  late String documentId = widget.Category;
  late String Addid = widget.Subcollection;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<AnnouncementData>?>(
      future: announcementController.getCurrentImageData(documentId, Addid),
      builder: (BuildContext context, AsyncSnapshot<List<AnnouncementData>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.shade300,
              ),
            ),
          );
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Container();
        } else {
          return Container(
            child: Column(
              children: [
                for (var data in snapshot.data!)
                  Container(
                    width: size.width * 1,
                    margin: EdgeInsets.only(bottom: 30, top: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.7,
                          width: size.width * 1,
                          child: CachedNetworkImage(
                            imageUrl: data.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 5,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: size.height * 0.05,
                            color: Colors.black,
                            child: Text(
                              data.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'RobotoCondensed',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          child: OutlinedButton(
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), child: null,
                          
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: size.width * 0.3,
                            height: size.height * 0.05,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Shop now',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}

// class VideoPlayerScreen extends StatefulWidget {
//   final String Category;
//   VideoPlayerScreen({required this.Category});
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//
//    final announcementController = Get.find<AnnouncementController>();
//    late  String documentId = widget.Category;
//
//   @override
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size size=MediaQuery.of(context).size;
//     return
//      FutureBuilder<String?>(
//       future: announcementController.getCurrentImageUrls(documentId),
//       builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Shimmer.fromColors(
//               baseColor: Colors.grey[300]!, // Adjust the base and highlight colors
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: ((size.height * 0.1)-40),
//                 width: size.width,
//                 margin: EdgeInsets.only(left: 5,right: 5,top: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.grey.shade300,
//                 ),
//               )
//           );
//
//         } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
//           return Container();
//         } else {
//           return
//             Container(
//                     child: Stack(
//                       children:[
//                         Container(
//                           color: Colors.white,
//                         height:size.height*0.7,
//                           width: size.width*1,
//                           margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
//                           // duration: Duration(seconds: 2),
//                           child: Stack(
//                               children:[
//
//                                 Container(
//                                     height:size.height*0.7,
//                                     width: size.width*1,
//                                     child: Image.network(snapshot.data!,fit: BoxFit.cover,)),
//                                 Positioned(
//                                   bottom: 20,
//                                  right: 20,
//                                  child: Column(
//                                    children: [
//                                      Container(
//                                        // alignment: Alignment.center,
//                                        width:size.width*0.3,
//                                        height: size.height*0.05,
//                                        color: Colors.white,
//                                        child:
//                                        Row(
//                                          mainAxisAlignment: MainAxisAlignment.center,
//                                          children: [
//                                            Text( 'Shop now',style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold
//                                 ),),
//                                            // Icon(Icons.arrow_forward_outlined,size: 15,color: Colors.white,)
//                                          ],
//                                        ),
//                                      ),
//
//                                    ],
//                                  )),
//
//                   ]
//                           )),
//                     ]
//                   )
//           );
//         }
//       },
//     );
//
//   }
//
// }
//
//
// //
// // class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
// //   late CachedVideoPlayerController _controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = CachedVideoPlayerController.network(
// //       "https://firebasestorage.googleapis.com/v0/b/groots-77ea3.appspot.com/o/Adidas%20UltraBOOST%20Running%20Commercial%20(1)%20(1).mp4?alt=media&token=180459d5-6d52-49fa-bd58-5ddfcbaa60ef&_gl=1*8ckmhv*_ga*NDMzNDg4MDE3LjE2ODEyMzQxMjg.*_ga_CW55HF8NVT*MTY5ODkxMDQ5NS4xNzMuMS4xNjk4OTExNzEzLjUzLjAuMA..",
// //     );
// //
// //     _controller.initialize().then((_) {
// //       setState(() {
// //         // Once the video is initialized, play it and set looping to true.
// //         _controller.play();
// //         _controller.setLooping(true);
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Container(
// //       child: _controller.value.isInitialized
// //           ? AspectRatio(
// //         aspectRatio: _controller.value.aspectRatio,
// //         child: Stack(
// //           children: [
// //             CachedVideoPlayer(_controller),
// //             Positioned(
// //                 bottom: 30,
// //                 left: 20,
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       // alignment: Alignment.center,
// //                       width:size.width*0.3,
// //                       height: size.height*0.05,
// //                       color: Colors.white,
//                       child:
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text( 'SHOP ',style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold
//                           ),),
//                           Icon(Icons.arrow_forward_outlined)
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // alignment: Alignment.center,
//                       width:size.width*0.3,
//                       height: size.height*0.05,
//                       color: Colors.white,
//                       child:
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text( 'SHOP ',style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold
//                           ),),
//                           Icon(Icons.arrow_forward_outlined)
//                         ],
//                       ),
//                     ),
//
//
//                   ],
//                 )),
//             // Your additional UI elements
//           ],
//         ),
//       )
//           : CircularProgressIndicator(), // Display a loading indicator while the video is loading.
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
//
//
//
//
// //
// //
// // class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
// //   late VideoPlayerControllerWrapper _controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerControllerWrapper(
// //       VideoPlayerController.network(
// //         "https://firebasestorage.googleapis.com/v0/b/groots-77ea3.appspot.com/o/Adidas%20UltraBOOST%20Running%20Commercial%20(1)%20(1).mp4?alt=media&token=180459d5-6d52-49fa-bd58-5ddfcbaa60ef&_gl=1*8ckmhv*_ga*NDMzNDg4MDE3LjE2ODEyMzQxMjg.*_ga_CW55HF8NVT*MTY5ODkxMDQ5NS4xNzMuMS4xNjk4OTExNzEzLjUzLjAuMA..",
// //       ),
// //     );
// //
// //     _controller.initialize().then((_) {
// //       setState(() {
// //         // Once the video is initialized, play it and set looping to true.
// //         _controller.play();
// //         _controller.setLooping(true);
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return Container(
// //       child: _controller.value.isInitialized
// //           ? AspectRatio(
// //         aspectRatio: _controller.value.aspectRatio,
// //         child: Stack(
// //           children: [
// //             // VideoPlayer(_controller),
// //             AnimatedContainer(
// //                 height:size.height*1,
// //                 width: size.width*1,
// //                 duration: Duration(seconds: 2),
// //                 child: Stack(
// //                     children:[
// //                       CachedVideoPlayer(_controller),
// //                       Positioned(
// //                           bottom: 30,
// //                           left: 20,
// //                           child: Column(
// //                             children: [
// //                               Container(
// //                                 // alignment: Alignment.center,
// //                                 width:size.width*0.3,
// //                                 height: size.height*0.05,
// //                                 color: Colors.white,
// //                                 child:
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Text( 'SHOP ',style: TextStyle(
// //                                         color: Colors.black,
// //                                         fontWeight: FontWeight.bold
// //                                     ),),
// //                                     Icon(Icons.arrow_forward_outlined)
// //                                   ],
// //                                 ),
// //                               ),
// //                               Container(
// //                                 // alignment: Alignment.center,
// //                                 width:size.width*0.3,
// //                                 height: size.height*0.05,
// //                                 color: Colors.white,
// //                                 child:
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Text( 'SHOP ',style: TextStyle(
// //                                         color: Colors.black,
// //                                         fontWeight: FontWeight.bold
// //                                     ),),
// //                                     Icon(Icons.arrow_forward_outlined)
// //                                   ],
// //                                 ),
// //                               ),
// //
// //
// //                             ],
// //                           )),
// //
// //                     ]
// //                 )),
// //           ]
// //             // Your additional UI elements
// //           ],
// //         ),
// //       )
// //           : null,
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     _controller.dispose();
// //   }
