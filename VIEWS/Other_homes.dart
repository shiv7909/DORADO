
import 'package:flutter/material.dart';
import 'package:untitled1/VIEWS/Account/account_signout.dart';
import 'package:untitled1/VIEWS/AR/ar.dart';
import 'Other_Appbar.dart';

import 'Cart/cart_App_bar.dart';
import 'bottom_navigator.dart';
import 'Search/1_body.dart';

class navigated_Home extends StatefulWidget {

  final int index;
  navigated_Home({
    required this.index,
  });

  @override
  State<navigated_Home> createState() => _navigated_HomeState();
}

class _navigated_HomeState extends State<navigated_Home> with AutomaticKeepAliveClientMixin{

  bool get wantKeepAlive=> true;

  @override

  Widget build(BuildContext context) {
    int Index = widget.index;

    @override

    List<Widget> Bodies = [
      body(),
      ArScreen(),
      body(),
      // shopping_bag_PageWithOptions(),      // HomeScreen1(),
      SignOut(),
    ];

    List<PreferredSizeWidget> Heads=[
      Appbar2(),
      AppBar(),
      cart_icon_head(),
      AppBar(),
    ];


     List<String> selectedRoute=[
     '/navigated_home_0',
     '/navigated_home_1',
     '/navigated_home_2',
     '/navigated_home_3',
     ];

    return SafeArea(
      child: Scaffold(
        appBar: Heads[widget.index],
        body: Bodies[widget.index],
        bottomNavigationBar: Index!=1? bottom_navigator( selectedRoute: selectedRoute[widget.index],):null,
      ),
    );
  }

}
