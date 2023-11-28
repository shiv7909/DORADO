import 'package:flutter/material.dart';

class Home_slider extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_slider> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(top: 8,bottom: 8),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assists/images/images1.jpeg"),
            fit: BoxFit.cover,
            // alignment: Alignment(pageOffset.abs() * 0.1, 0),
            // fit: BoxFit.cover,
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            Container(
            child: Column(
            children:[
                // for (var data in snapshot.data!)
            Container(
              width: size.width * 1,
              // margin: EdgeInsets.only(bottom: 30, top: 20),
              child: Stack(
                children: [
                  Container(
                    // height: size.height * 0.05,
                    width: size.width * 1,
                    // child:
                    // CachedNetworkImage(
                    //   imageUrl: data.imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  // Positioned(
                  //   left: 5,
                  //   top: 5,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.only(left: 10, right: 10),
                  //     height: size.height * 0.05,
                  //     color: Colors.black,
                  //     child: Text(
                  //       // data.name,
                  //       "Hello",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w500,
                  //         fontFamily: 'RobotoCondensed',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: OutlinedButton(
                      onPressed: () {
                        // Add your onPressed function here
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Text('SNEAKERS'),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.05,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shop now',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    ),


                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20,top: 10),
                    child: Text(
                      'Just Dropped Collection',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                        // fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height*0.5,
                    // padding: EdgeInsets.only(bottom: size.height*0.01),
                  child: PageView.builder(
                      itemCount: paintings.length,
                      controller: pageController,
                      itemBuilder: (context, i) {
                        return Transform.scale(
                          scale: 1,
                          child: Container(
                             padding: EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    paintings[i]['image'],
                                       height: size.height*0.43,
                                    width: size.width*0.7,
                                    fit: BoxFit.cover,
                                    alignment:
                                    Alignment(-pageOffset.abs() + i, 0),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              height: size.height*0.06,
              width: size.width,
              color: Colors.black,
              padding: EdgeInsets.only(right: 15,top: 4,bottom: 4),

              child: Text(
                // paintings[i]['name'],
                'SHOP COLLECTION',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
    );
  }
}



List<Map> paintings = [
  {
    'image': 'assists/images/Screenshot 2023-11-05 184552.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/icons/Screenshot 2023-11-05 010458.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/images/1.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/images/4.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/images/5.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/images/6.png',
    'name': 'SHOP',
  },
  {
    'image': 'assists/images/3.png',
    'name': 'SHOP',
  },
];