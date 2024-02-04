import 'package:flutter/material.dart';
import 'register.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';

class homm extends StatefulWidget {
  @override
  State<homm> createState() => _hommState();
}

class _hommState extends State<homm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //notification icon
            Container(
              padding: EdgeInsets.only(right: 20, left: 15, top: 10),
              margin: EdgeInsets.only(left: 320),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color(0xFFbe6d41),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 2,
                          )
                        ]),
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.red,
                        padding: EdgeInsets.all(7),
                      ),
                      badgeContent: Text(
                        "3",
                        style: TextStyle(color: Colors.white),
                      ),
                      child: InkWell(
                        child: Icon(
                          CupertinoIcons.bell,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 11),
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD2D5D2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here...", border: InputBorder.none),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list)
                ],
              ),
            ),
          ],
        ),
      )),
    );
    throw UnimplementedError();
  }
}

class favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Favourite",
        style: TextStyle(color: Colors.blueGrey, fontSize: 30),
      )),
      backgroundColor: Colors.white,
    );
    throw UnimplementedError();
  }
}

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Profile",
        style: TextStyle(color: Colors.blueGrey, fontSize: 30),
      )),
      backgroundColor: Colors.white,
    );
    throw UnimplementedError();
  }
}
