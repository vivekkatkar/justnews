import 'package:flutter/material.dart';
import 'first.dart';

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
    favourite(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yoga",
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
              selectedItemColor: Color(0xFFbe6d41),
              unselectedItemColor: Color(0xFFbe6d41),
              backgroundColor: Color(0xFFD2D5D2),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favourite"),
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
