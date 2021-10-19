import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/floatingNotice.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/items.dart';

import '../../../constrants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 7.0,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 18, right: 18),
            width: double.infinity,
            height: size.height * .12,
            decoration: BoxDecoration(
                color: primaryBrown,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(isDrawerOpen ? 40 : 0.0),
                    topRight: Radius.circular(isDrawerOpen ? 40 : 0.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        tooltip: 'Close',
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                        icon: Icon(Icons.close),
                      )
                    : IconButton(
                        tooltip: 'Menu',
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 90;
                            scaleFactor = 0.8;
                            isDrawerOpen = true;
                          });
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                Text(
                  "GLBITM APP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/notificationScreen");
                  },
                  icon: Icon(
                    Icons.notifications,
                  ),
                  color: Colors.white,
                  tooltip: 'Notifications',
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: size.height * .014,
          // ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        height: size.height * .35,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(38)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: FloatingNotice(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  Items(
                    imgName: "clubs",
                    press: () {
                      Navigator.pushNamed(context, "/collgeclubs");
                    },
                    text: "College Clubs",
                  ),
                  Items(
                    imgName: "photo",
                    press: () {
                      Navigator.pushNamed(context, "/photogallery");
                    },
                    text: "Photo Gallery",
                  ),
                  Items(
                    imgName: "contacts",
                    press: () {
                      Navigator.pushNamed(context, "/contacts");
                    },
                    text: "Contacts",
                  ),
                  Items(
                    imgName: "calender",
                    press: () {
                      Navigator.pushNamed(context, "/timetable");
                    },
                    text: "Time Table",
                  ),
                  Items(
                    imgName: "feedback",
                    press: () {
                      Navigator.pushNamed(context, "/feedback");
                    },
                    text: "Feedback",
                  ),
                  Items(
                    imgName: "notes",
                    press: () {
                      Navigator.pushNamed(context, "/notes");
                    },
                    text: "Notes",
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: ItemBox(),
                  // ),
                ],
              ),
            ),
          ),

          // end of app bar
        ],
      ),
    );
  }
}
