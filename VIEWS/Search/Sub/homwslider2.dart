import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/CONTROLLERS/carousel/home_carousel_controller.dart';



class slider2 extends StatefulWidget {

  const slider2({Key? key, required this.controller}) : super(key: key);

  final carouselController controller;

  @override
  _slider2 createState() => _slider2();
}

class _slider2 extends State<slider2> {
  int _currentIndex = 0;
  List<String> _imageList = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    widget.controller.getCarouselData().then((carouselModel) {
      setState(() {
        _imageList = carouselModel.imageUrls;
      });

      // Start the timer to move the carousel automatically
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        final int newIndex = (_currentIndex + 1) % _imageList.length;
        setState(() {
          _currentIndex = newIndex;
        });
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          items: _imageList.map((image_url){

            return GestureDetector(
              onTap: () {
              },
              child: Stack(
                  children: [
                    Container(
                      height: size.height*0.1+20,
                      margin: EdgeInsets.only(left: size.width/10,right: size.width/10,top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(image_url,), fit: BoxFit.fill
                          )
                      ),
                    ),
                  ]
              ),
            );
          }).toList(),
          options: CarouselOptions(
           // enlargeCenterPage: true,
            height: size.height*0.1+20,
            viewportFraction:1,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            autoPlay: true,
            // enable automatic sliding
            autoPlayInterval: Duration(seconds: 3),
            // set sliding interval
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            // set sliding animation duration
            autoPlayCurve: Curves.fastOutSlowIn, // set sliding animation curve
          ),
        ),
        Container(
          height: size.height*0.1+20,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              List.generate(5, (index) =>
                 Container(
                      child: Icon(Icons.circle,
                        size: 5.0,
                        color: _currentIndex == index ? Colors.white : Colors
                            .blue.shade300,
                      ),
                  ),),
            )
        )
      ],

    );
  }
}

// Widget stringToWidget(String widgetName) {
//   switch(widgetName) {
//     case 'plant magazine':     // make separate dedicated widget navigate to magazine page
//       return HomeScreen();
//     case 'offers':                   // up to 45%0ff catagory
//       return HomeScreen();
//     case 'new arrivals':                // make separate dedicated widget
//       return HomeScreen();
//     case 'design ideas':                     //  make separate dedicated widget navigate to which will present in magazine
//       return Signup();
//     case 'naviconplantHome(index: 4)':        // think and create some feature
//       return HomeScreen( );
//     default :
//       return Container();
//   }
// }
