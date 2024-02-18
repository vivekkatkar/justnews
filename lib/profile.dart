import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'home.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(right: 20, left: 15, top: 50, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => home()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: badges.Badge(
                    child: InkWell(
                      onTap: () {
                        showSlidingBottomSheet(context, builder: (context) {
                          return SlidingSheetDialog(
                            elevation: 8,
                            cornerRadius: 16,
                            builder: (context, state) {
                              return bottomoptions();
                            },
                          );
                        });
                      },
                      child: Icon(
                        CupertinoIcons.text_justify,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 50), // Add spacing between the text and the profile image
          CircleAvatar(
            radius: 90, // Adjust the size of the circle avatar as needed
            backgroundImage: AssetImage(
                "assets/images/profile.png"), // Replace with your image path
          ),
          SizedBox(
            height: 20,
          ),
          Text("Username",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          Text("10", style: TextStyle(fontSize: 15)),
          Text("posts",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class bottomoptions extends StatelessWidget {
  const bottomoptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Share",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Saved",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.save,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Favourites",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            ListTile(
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
