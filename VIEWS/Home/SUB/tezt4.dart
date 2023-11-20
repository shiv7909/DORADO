// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size size=MediaQuery.of(context).size;
//
//     return Container(
//       // color: Colors.blueGrey,
//       height: 100,
//       child: Center(
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Be',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             AnimatedTextKit(
//               animatedTexts: [
//                 RotateAnimatedText('AWESOME'),
//                 RotateAnimatedText('OPTIMISTIC'),
//                 RotateAnimatedText('DIFFERENT'),
//               ],
//               onTap: () {
//                 print("Tap Event");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   }
//
