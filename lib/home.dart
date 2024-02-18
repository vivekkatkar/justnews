import 'package:flutter/material.dart';
import 'package:justnews/termsConditions.dart';
import 'first.dart';
import 'profile.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homestate();
  }
}

class _homestate extends State<home> {
  int tabindex = 0;
  var tabpages = [
    homm(),
    CreatePostPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JUSTNEWS",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(22.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Color(0xFFD2D5D2),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined), label: "Post"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
              currentIndex: tabindex,
              onTap: (setValue) {
                setState(() {
                  tabindex = setValue;
                });
              },
            ),
          ),
        ),
        body: tabpages[tabindex],
      ),
    );
    // throw UnimplementedError();
  }
}
