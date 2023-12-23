import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/VIEWS/signin,login,intro/Login_page.dart';
import 'package:untitled1/MODELS/constants.dart';
import 'package:untitled1/VIEWS/signin,login,intro/splashbind.dart';
import 'CONTROLLERS/Cart/Retriving_controllers/cart_items_retrive_controller.dart';
import 'CONTROLLERS/Navigation_panels/Navigation_1_controller.dart';
import 'CONTROLLERS/QuoteController.dart';
import 'CONTROLLERS/Title_retriver_controller.dart';
import 'CONTROLLERS/anncoucement_controller.dart';
import 'CONTROLLERS/auth_controller.dart';
import 'CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
import 'VIEWS/Other_homes.dart';
import 'VIEWS/signin,login,intro/introvedio.dart';
import 'VIEWS/HOME.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


   // Get.lazyPut<ProductController>(() => ProductController());
  // Get.lazyPut<ProductController>(() => ProductController);

  NavigationController _navigationController=Get.put(NavigationController());
  _navigationController.fetchNavigationItems();

  ProductController productController=Get.put(ProductController());
    productController.fetchProductsFromPanel('Featuring_panel');




   // Get.lazyPut<QuoteController>(()=>QuoteController());
  QuoteController quoteController=Get.put(QuoteController());

  Title_retriever titleRetriever= Get.put(Title_retriever());


  CartProductController cart_item_controller = Get.put(CartProductController());
   // cart_item_controller.getProductsFromCart();

   AnnouncementController announcementController = Get.put(AnnouncementController());



  final authController = Auth_controller();
  Get.put(authController, permanent: true);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DORADO',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundcolor,
        primaryColor: kPrimarycolor,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(bodyColor: kTextcolor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialBinding: SplashBinding(),
       initialBinding: UserCheckBinding(), //Use the SplashBinding
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => VideoSplashScreen(),
        ),
         GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(
            name: '/navigated_home_0', page: () => navigated_Home(index: 0)),
        GetPage(
            name: '/navigated_home_1', page: () => navigated_Home(index: 1)),
        GetPage(
            name: '/navigated_home_2', page: () => navigated_Home(index: 2)),
        GetPage(
            name: '/navigated_home_3', page: () => navigated_Home(index: 3)),
        // Add more routes as needed
      ],
    );
  }
}