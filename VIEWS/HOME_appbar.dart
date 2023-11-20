import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CONTROLLERS/Title_retriver_controller.dart';
import 'Home/drawer/DRAWER.dart';



class Home_appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    String title = 'HEADER_title';
    final titleRetriever = Get.find<Title_retriever>();

    return Material(
      elevation: 1,
      child: ListView(children: [
        SafeArea(
          child: Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white24,
                  Colors.white24,
                  // Color(0xFFFFFFFF),
                ],
              )),
              child: Column(
                children: [
                  Row(
                    //here no need to implement row but for future purpose we just created
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder<String>(
                          future: titleRetriever.fetchTitle(title),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                height: 20,
                                margin: EdgeInsets.only(left: 15, right: 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              );
                            } else {
                              return Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 60,
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => DRAWER());
                                    },
                                    child: Text(
                                      snapshot.data!.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                              );
                            }
                          }),

                      Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 60,
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () {
                              Get.to(() => DRAWER());
                            },
                            child: Icon(
                              Icons.list_rounded,
                              color: Colors.black,
                              size: 30,
                            )),
                      ),
                      // Header(),
                    ],
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
