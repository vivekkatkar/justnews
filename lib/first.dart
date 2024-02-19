import 'package:flutter/material.dart';
import 'register.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category.dart';
import 'popular.dart';

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
                        color: Colors.black,
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
                      child:Container(),
                      // InkWell(
                      //   child: Icon(
                      //     CupertinoIcons.bell,
                      //     size: 30,
                      //     color: Colors.white,
                      //   ),
                      // ),
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

            //Carouselslider
            Container(
                child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1),
                    //height: 300,
                    width: 500,
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: [
                            Container(
                              width: 400,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img1.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: 400,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img2.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: 400,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img3.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: 400,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img4.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: 400,
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img5.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: 220.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 600),
                            viewportFraction: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ))
            ])),

            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoriesWidget(),
                  PopularItemsWidget(),
                ],
              ),
            ),

            // Container(
            //   padding: EdgeInsets.only(top: 20),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(30),
            //           topRight: Radius.circular(30))),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       //CategoriesWidget(),
            //       PopularItemsWidget(),
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
    throw UnimplementedError();
  }
}
