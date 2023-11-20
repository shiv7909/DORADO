import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideScreen extends StatefulWidget {
  @override
  _SideScreenState createState() => _SideScreenState();
}

class _SideScreenState extends State<SideScreen> {
  final bool isSidebarOpened = true;

   @override
   void initState(){
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(60, 40),
                topRight: Radius.elliptical(60, 40),
              ),

              // image: DecorationImage(
              //   image: AssetImage('assists/images/Screenshot 2023-09-20 163652.png'),
              //   fit: BoxFit.fill,
              // ),

            ),
            height: size.height,
            width: size.width - 10,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: size.height * 0.2,
                      color: Colors.lightBlue[50],
                      child: Image.asset('assists/images/Project_Name__3_-removebg-preview.png'),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      
                      // child: WebViewWidget(
                      //     controller: controller = WebViewController()
                      //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      //   ..setBackgroundColor(const Color(0x00000000))
                      //   ..setNavigationDelegate(
                      //     NavigationDelegate(
                      //       onProgress: (int progress) {
                      //         // Update loading bar.
                      //       },
                      //       onPageStarted: (String url) {},
                      //       onPageFinished: (String url) {},
                      //       onWebResourceError: (WebResourceError error) {},
                      //       onNavigationRequest: (NavigationRequest request) {
                      //         if (request.url.startsWith('https://pub.dev/packages/permission_handler/install')) {
                      //           return NavigationDecision.prevent;
                      //         }
                      //         return NavigationDecision.navigate;
                      //       },
                      //     ),
                      //   )
                      //   ..loadRequest(Uri.parse('https://pub.dev/packages/permission_handler/install'))
                      // )
                      
                      
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      '◀️BACK',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
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
}
