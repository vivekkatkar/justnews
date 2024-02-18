import 'package:flutter/material.dart';

class PopularItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              for (int i = 1; i < 11; i++)
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 370,
                  // height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6)
                      ]),
                  child: Column(
                    children: [
                      Text(
                        "'India vs England, 3rd Test Day 4 Live Updates: Onus On Yashasvi Jaiswal, Sarfaraz Khan As India Go 4 Down vs England'",
                        style: TextStyle(
                          fontSize: 15, // Set the font size
                          fontWeight: FontWeight.bold, // Set the font weight
                          color: Colors.white, // Set the text color
                          fontStyle: FontStyle.italic, // Set the font style
                          letterSpacing: 1.2, // Set the letter spacing
                          // Add more style properties as needed
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(4),
                          child: Image.asset(
                            "assets/images/img6.png",
                            height: 190,
                            width: 400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Arjun Mishra",
                                style: TextStyle(
                                  fontSize: 14, // Set the font size
                                  fontWeight:
                                      FontWeight.bold, // Set the font weight
                                  color: Colors.white, // Set the text color
                                  fontStyle:
                                      FontStyle.normal, // Set the font style
                                  letterSpacing: 1.2, // Set the letter spacing
                                  // Add more style properties as needed
                                ),
                              ),
                              Text(
                                "Sunday, 18 Feb 2024",
                                style: TextStyle(
                                  fontSize: 14, // Set the font size
                                  fontWeight:
                                      FontWeight.bold, // Set the font weight
                                  color: Colors.white, // Set the text color
                                  fontStyle:
                                      FontStyle.normal, // Set the font style
                                  letterSpacing: 1.2, // Set the letter spacing
                                  // Add more style properties as needed
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "itemPage");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.comment,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "itemPage");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.thumb_up,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "itemPage");
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.poll,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
