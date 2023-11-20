import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:untitled1/CONTROLLERS/carousel/home_carousel_controller.dart';



class HomeCarouselSlider extends StatefulWidget {


  const HomeCarouselSlider({Key? key, required this.carouselcontroller}) : super(key: key);

  final carouselController carouselcontroller;


  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<HomeCarouselSlider> {
  int _currentIndex = 0;
  List<String> _imageList = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Fetch carousel data from the controller
    widget.carouselcontroller.getCarouselData().then((carouselModel) {
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
                      height: size.height*0.27,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          image: DecorationImage(
                              image: NetworkImage(image_url,),
                              // fit: BoxFit.fill
                          )
                      ),
                    ),
                  ]
              ),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: false,
            height: size.height*0.27,
            viewportFraction: 1,
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
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            // set sliding animation duration
            autoPlayCurve: Curves.fastOutSlowIn, // set sliding animation curve
          ),
        ),
        Container(
            height: size.height*0.27,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              List.generate(5, (index) =>
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.all(1),
                      child: Icon(
                        Icons.circle,
                        size: 5.0,
                        color: _currentIndex == index ? Colors.black : Colors
                            .grey,
                      ),
                  ),),
            )
        )
      ],

    );
  }
}

