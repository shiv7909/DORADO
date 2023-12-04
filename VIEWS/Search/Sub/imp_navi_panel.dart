
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../CONTROLLERS/Navigation_panels/Navigation_1_controller.dart';
import '../../Home/drawer/DRAWER.dart';


class imp_navi_panel extends StatefulWidget {
  @override
  _imp_navi_panelState createState() => _imp_navi_panelState();
}

class _imp_navi_panelState extends State<imp_navi_panel> {

   NavigationController _navigationController = Get.find<NavigationController>();
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is first created
    // _navigationController.fetchNavigationItems();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      if (_navigationController.isLoading.value) {
        return Shimmer.fromColors(
            baseColor: Colors.grey[300]!, // Adjust the base and highlight colors
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: size.height*0.1,
              width: size.width,
            ),);
      } else if (_navigationController.hasError.value) {
        return Text('Error');
      } else {
        final navigationItems = _navigationController.navigationItems;

        // Now you can use 'navigationItems' to build your UI
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white],
              ),
            ),
            child: Row(
              children: navigationItems.map((item) {
                return imp_navi_icons(
                  name: item.name,
                  iconpath: item.iconpath,
                  ontap: () {
                    Get.to(() => DRAWER());
                  },
                );
              }).toList(),
            ),
          ),
        );
      }
    });
  }
}

class imp_navi_icons extends StatelessWidget {
  const imp_navi_icons({
    super.key,
    required this.iconpath,
    required this.name,
    required this.ontap,
  });

  final String iconpath, name;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.only(left: 15),
      child: Column(
        children: <Widget>[

          InkWell(
            onTap: () {
              ontap();
            },
            child: CircleAvatar(
              // radius: size.height * 0.0429,
              radius: size.width*0.095,
              backgroundColor:
              Color(0x45B56B34),

              //  Color(0xFFB29361),
              // Color(0xFF62A29A),
              //  Color(0xFF32745C),
              child: ClipOval(
                child: Image.network(
                  iconpath,
                  // width: size.width * 0.18, // Set the image size
                  // height: size.width * 0.18, // Set the image size
                  fit: BoxFit.cover, // Ensure the image fits within the circular boundary
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3, bottom: 3),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

