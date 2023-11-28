// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
//
//
// class SplashBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => VideoSplashScreen());
//   }
// }
//
//
// class VideoSplashScreen extends StatefulWidget {
//   @override
//   _VideoSplashScreenState createState() => _VideoSplashScreenState();
// }
//
// class _VideoSplashScreenState extends State<VideoSplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Start a timer when the screen is initialized
//     Future.delayed(Duration(seconds: 10), () {
//       Get.offAllNamed('/home'); // Navigate to the home screen after 10 seconds
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF294B3D),
//       body: Center(
//         child: Image.asset('assists/images/bl.png', fit: BoxFit.fill),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';








class VideoSplashScreen extends StatefulWidget {
  @override
  _VideoSplashScreenState createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with your video asset or URL
    _controller = VideoPlayerController.asset('assists/icons/DORADO.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
        // Play the video automatically
        _controller.play();
      });

    // Start a timer to navigate to the home screen after the video duration
    Future.delayed( Duration(seconds: 3), ()  {
      _controller.pause();
      Get.offAllNamed('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: Center(
        child:
        // _controller.value.isInitialized
        //     ?
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            // : CircularProgressIndicator(), // Display a loading indicator until video is ready
      ),
    );
  }
}