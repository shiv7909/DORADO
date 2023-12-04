import 'package:flutter/material.dart';
import 'package:untitled1/VIEWS/Search/Sub/title_with_more_btn.dart';

import 'SUB/Home_stories.dart';
import 'SUB/test2.dart';
import 'SUB/Home_slider.dart';
import '../Search/Sub/featuring_panel.dart';



class Home_Recommendations extends StatefulWidget {
  Home_Recommendations({required this.category});
  final String category;
  @override
  State<Home_Recommendations> createState() => _Home_RecommendationsState();
}
class _Home_RecommendationsState extends State<Home_Recommendations>  with AutomaticKeepAliveClientMixin{

  bool get wantKeepAlive=> true;
  @override
  Widget build(BuildContext context) {
    // it will provide us the total height and width of the screen
    // it enables scrolling on the small device
    return RefreshIndicator(
      //add to refresh the screen
        color: Colors.blue,
        displacement: 20,
        onRefresh: () async {
          // await _fetchUpdatedData();
        },
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              // Home_stories(),
              // VideoPlayerScreen(),
              // MyHomePage(),

              VideoPlayerScreen(Category: '${widget.category}', Subcollection: 'Add1',),
               Home_slider(),
              VideoPlayerScreen(Category: '${widget.category}', Subcollection: 'Add2',),

              TitleWithMoreBtn(title: 'Title2', size: 15,),
              FeaturingPanel(),

              SizedBox(height: 80,)
            ],
          ),
        )

    );
  }
}


// class show_cart_items extends StatefulWidget {
//
//   @override
//   State<show_cart_items> createState() => _cart();
// }
//
// class _cart extends State<show_cart_items> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       child:
//       Column(
//         children: [
//
//         ],
//       ),
//     );
//   }
// }


