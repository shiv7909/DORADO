import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../CONTROLLERS/carousel/home_carousel_controller.dart';
import '../../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
import 'Sub/announcement1.dart';
import 'Sub/featuring_panel.dart';
import 'Sub/homwslider2.dart';
import 'Sub/imp_navi_panel.dart';
import 'Sub/impnavibar_heading.dart';
import 'Sub/title_with_more_btn.dart';




class body extends StatefulWidget {

  final ProductController controller; // Add this line to accept the controller

  body({required this.controller});

  @override
  State<body> createState() => _bodyState();
}



class _bodyState extends State<body> with AutomaticKeepAliveClientMixin<body> {

  @override
  bool get wantKeepAlive => true;
    @override
    Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
      super.build(context);

      return RefreshIndicator(
        color: Colors.blue,
        displacement: 50,
        onRefresh: () async {
           widget.controller.fetchProducts(); // Trigger the fetchProducts function in the controller
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // VideoPlayerScreen(),
              impnavi_head(),
              imp_navi_panel(),
              // imp_navi_panel(controller: widget.controller,),
          //     Stack(
          //       children:[
          //         Container(
          //         height:size.height*0.28,
          //         width: size.width,
          //           child: Image.asset('assists/images/bgbgbggbggg.png',fit: BoxFit.cover,),
          //       ),
          //         Container(
          //           alignment: Alignment.center,
          //           height:size.height*0.28,
          //           width: size.width,
          //           color:
          //           Colors.transparent,
          //           child: Image.asset('assists/images/Screenshot 2023-10-27 131951.png',),
          //         ),
          // ]
          //     ),
              // Announcement2(),
              // HomeCarouselSlider(carouselcontroller: carouselController(firestore: FirebaseFirestore.instance)),
              TitleWithMoreBtn( title: 'Title1', size: 15,),
              FeaturingPanel(),
              TitleWithMoreBtn( title: 'Title2', size: 15,),
              FeaturingPanel(),
              Announcement1(),
              SizedBox(height: 15,),
              slider2(controller: carouselController(firestore: FirebaseFirestore.instance)),
              TitleWithMoreBtn( title: 'Title3', size: 15,),
              FeaturingPanel(),
            ],
          ),
        ),
      );
    }
  }





















//
//
//
// class Body extends StatefulWidget {
//   final ProductController controller;
//
//   Body({required this.controller});
//
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> with AutomaticKeepAliveClientMixin<Body> {
//   @override
//   bool get wantKeepAlive => true;
//
//   double yOffset = 1.0;
//
//   @override
//   void initState() {
//     super.initState();
//     // Delay the animation to give time for the UI to build
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         yOffset = 0.0; // Move widgets from yOffset 1.0 to 0.0
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//
//     return RefreshIndicator(
//       color: Colors.blue,
//       displacement: 50,
//       onRefresh: () async {
//         widget.controller.fetchProducts();
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 350), // Adjust animation speed as needed
//         transform: Matrix4.translationValues(0, yOffset * 100, 0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               impnavi_head(),
//
//               imp_navi_panel(),
//               Stack(
//                 children: [
//                   // Your stack content
//                 ],
//               ),
//               Announcement2(),
//               HomeCarouselSlider(
//                 carouselcontroller: carouselController(firestore: FirebaseFirestore.instance),
//               ),
//               TitleWithMoreBtn(title: 'Title1',),
//               FeaturingPanel(),
//               TitleWithMoreBtn(title: 'Title2',),
//               FeaturingPanel(),
//               Announcement1(),
//               SizedBox(height: 15,),
//               slider2(
//                 controller: carouselController(firestore: FirebaseFirestore.instance),
//               ),
//               TitleWithMoreBtn(title: 'Title3',),
//               FeaturingPanel(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//
// class Most_popular extends StatefulWidget {
//   const Most_popular({
//     super.key,
//   });
//
//   @override
//   State<Most_popular> createState() => _Most_popularState();
// }
//
// // class _Most_popularState extends State<Most_popular> with AutomaticKeepAliveClientMixin<Most_popular> {
// //   @override
// //   bool get wantKeepAlive => true;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //
// //     return Container(
// //       margin: EdgeInsets.only(top: 6, bottom: 200),
// //       child: Stack(
// //         children: [
// //           Container(
// //             height: 60,
// //             decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 boxShadow: <BoxShadow>[
// //                   BoxShadow(
// //                     color: Colors.black54.withOpacity(0.1),
// //                     blurRadius: 5,
// //                   )
// //                 ]
// //             ),
// //           ),
// //           Container(
// //               height: 60,
// //               width: size.width,
// //               margin: EdgeInsets.only(left: 50, right: 50),
// //               padding: EdgeInsets.only(top: 20),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.all(Radius.elliptical(90, 180)),
// //                 //color:Color(0XFFCCEAE6),
// //               ),
// //               child: Text('MOST POPULAR',textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),)
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
