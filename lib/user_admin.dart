import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:justnews/Login.dart';

class user_admin extends StatelessWidget {
  const user_admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.black,
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                            width:
                                38), // Add some space between the icon and text
                        Text(
                          'User Login',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.black,
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.admin_panel_settings),
                        SizedBox(
                            width:
                                38), // Add some space between the icon and text
                        Text(
                          'Admin Login',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
