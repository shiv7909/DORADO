//
//
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../signin,login,intro/Login_page.dart';
//
// // class sign_out extends StatefulWidget{
// //
// //   @override
// //   State<sign_out> createState()=> Signout();
// // }
// //
// // class Signout extends State<sign_out>{
// //   @override
// //
// //
// //   Widget build(BuildContext context){
// //
// //     return Scaffold(
// //       body: GestureDetector(
// //         onTap:() async {
// //           Auth_controller.instance.logOut();
// //            await Get.offAll(()=>Login());
// //         },
// //         child: Center(
// //           child: FaIcon(FontAwesomeIcons.arrowRightFromBracket)
// //         ),
// //       )
// //     );
// //   }
// //
// // }
//
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:untitled1/CONTROLLERS/auth_controller.dart';
// import 'signin,login,intro/Login_page.dart';
//
// class SignOut extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GetX<Auth_controller>(
//           init: Auth_controller(),
//           builder: (authController) {
//             if (authController._user != null) {
//               // User is logged in, show the sign-out button
//               return GestureDetector(
//                 onTap: () async {
//                   authController.logOut();
//                   await Get.offAll(() => Login());
//                 },
//                 child: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
//               );
//             } else {
//               // User is not logged in, show a dialog to log in
//               return ElevatedButton(
//                 onPressed: () {
//                   Get.to(() => Login());
//                 },
//                 child: Text('Log In'),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



class USER_CHECK extends GetxController {

  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _user.value = null;
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}


class SignOut extends StatelessWidget {
  // final USER_CHECK authController = USER_CHECK();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetX<USER_CHECK>(
        builder: (USER_CHECK controller) {
          if (controller.user != null) {
            // User is logged in, show the sign-out button
            return GestureDetector(
              onTap: () async {
                await controller.logOut();
                // Get.offAll(HomeScreen()); //dart Navigate to the Login screen
              },
              child: Center(
                child: Text('You have logged in',style: TextStyle(fontWeight: FontWeight.bold),),
              )
            );
          } else  {
            // User is not logged in, show a dialog to log in
            return ElevatedButton(
              onPressed: () {
                Get.to(Login()); // Navigate to the Login screen
              },
              child: Text('Log In'),
            );
          }
        },
      ),
    );
  }
}
