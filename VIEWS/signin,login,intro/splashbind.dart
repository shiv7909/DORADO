

import 'package:get/get.dart';

import '../Account/account_signout.dart';
import 'introvedio.dart';

class SplashBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => VideoSplashScreen());
  }
}



class UserCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(USER_CHECK()); // Initialize and register your USER_CHECK controller.
  }
}