import 'package:flutter/material.dart';
import '../Search/Sub/title_with_more_btn.dart';
import 'Home_recomendations.dart';



class Home_body extends StatefulWidget {
  @override
  Home_bodyState createState() =>
      Home_bodyState();
}

class Home_bodyState extends State<Home_body> {
  int selectedOption = 0; // Default option
  PageController pageController = PageController();


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _showOptions(BuildContext context,size) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: Colors.white,
          ),// Adjust the height as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                onPressed: () {
                  _selectOption(0);
                  Navigator.pop(context);
                },
                child: Text('Men',style: TextStyle(color: Colors.white),),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                ),
                onPressed: () {
                  _selectOption(1);
                  Navigator.pop(context);
                },
                child: Text('Women',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectOption(int option) {
    setState(() {
      selectedOption = option;
      pageController.animateToPage(option,
          duration: Duration(milliseconds: 100), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xffeae9e9),\
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Default selected option with bottom-up pop-up
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 1,right: 15,bottom: 10),
                  width: size.width ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleWithMoreBtn( title: 'Home_Title1', size: 13,),
                      InkWell(
                        onTap: (){
                          _showOptions(context,size);
                        },
                        child: Container(
                          // padding: EdgeInsets.all(5),
                          // color: Colors.grey[200],
                          child:
                            // OutlinedButton(
                            //   onPressed: () {
                            //     _showOptions(context,size);
                            //   },
                            //   style: ButtonStyle(
                            //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            //       EdgeInsets.only(left: 5),
                            //     ),
                            //   ),
                            //   child:
                              FittedBox(
                                alignment: Alignment.center,
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      selectedOption == 0 ? 'Men' : 'Women',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: selectedOption == 0 ? 13 : 11,
                                        color: selectedOption == 0
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down,color: Colors.grey,)
                                  ],
                                ),
                              ),
                            )
                        ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container to display different bodies
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (int index) {
                _selectOption(index);
              },
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Home_Recommendations(category: 'Men');
                } else {
                  return Home_Recommendations(category: 'Women',);
              };}
            ),
          ),
        ],
      ),
    );
  }
}