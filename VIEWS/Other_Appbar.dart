import 'package:flutter/material.dart';
import '../MODELS/constants.dart';

class Appbar2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
        onTap:() {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: (kDefaultPadding *2)-5),
          decoration: BoxDecoration(
             color: Color(0XFFCCEAE6),

            borderRadius: BorderRadius.only(
           //   bottomLeft: Radius.elliptical(180,90),
           //   bottomRight: Radius.elliptical(180,90),
            )
          ),

          child: Row(
            children: <Widget>[

              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.lightBlueAccent.withOpacity(0.3),
                          blurRadius: 10,
                        )
                      ],
                    ),


                    child: Row(
                      children : <Widget> [
                        IconButton(
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );}, icon: Icon(Icons.search),
                          alignment: Alignment.centerLeft,
                        ),
                        Text('search by product,brand & more..'),
                        Spacer(),
                        IconButton(
                            padding: EdgeInsets.only(right: 25),
                            onPressed: () {},
                            icon: Icon(
                              Icons.playlist_add,size: 20,
                              color: Colors.black54,
                            ),
                            alignment: Alignment.centerRight),

                      ],
                    ),

                  )
              )
            ],
          ),
        )
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerm = [
    'apple',
    'apple',
    'banana',
    'hello',
    'shiva',
    'billionaire',
    'happy',
    'money',
    'fame',
    'respect',
    'money',
    'fame',
    'respect',
  ];



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [
    ];
    for (var fruit in searchTerm) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerm) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
