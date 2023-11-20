//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled1/VIEWS/account_signout.dart';
// import '../VIEWS/signin,login,intro/Login_page.dart';
//
// class Account_icon extends StatefulWidget {
//   @override
//   State<Account_icon> createState() => account_icon();
// }
//
// class account_icon extends State<Account_icon> {
//   bool _isLoggedIn = false;
//   @override
//   void initState() {
//     super.initState();
//     checkCurrentUser();
//   }
//   void checkCurrentUser() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _isLoggedIn = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//      return
//        SignOut();
//        // _isLoggedIn ? sign_out() : Login();
//   }
// }
