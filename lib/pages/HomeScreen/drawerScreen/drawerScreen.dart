import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: secondaryYellow,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello, Glbian",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/appourteam");
                    },
                    leading: Icon(
                      Icons.group,
                      color: Colors.black,
                    ),
                    title: Text("Our Team"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/appfeedback");
                    },
                    leading: Icon(
                      Icons.feedback,
                      color: Colors.black,
                    ),
                    title: Text("App Feedback"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/appcontactus");
                    },
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text("Contact Us"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Settings")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Logout")
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
