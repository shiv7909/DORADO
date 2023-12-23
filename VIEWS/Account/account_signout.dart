
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import '../signin,login,intro/Login_page.dart';


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
    CartProductController cartproductcontroller=Get.put(CartProductController());
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
              child: Row(
                children: [
                  Center(
                    child: Text('You have logged in',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        cartproductcontroller.fetchProducts();
                      },
                      child: Text("Get cart details")),
                ],
              )
            );
          } else  {
            // User is not logged in, show a dialog to log in
            return Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(Login()); // Navigate to the Login screen
                  },
                  child: Text('Log In'),
                ),

              ],
            );
          }
        },
      ),
    );
  }
}
