import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/floatingNotice.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/CollegeClubs.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/PhotoGallery.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/TimeTable.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/contactUs.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/feedback.dart';
import 'package:glbapp/pages/HomeScreen/notifications/eventform.dart';


import '../../../constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:glbapp/Notifiaction_event/notification.dart';
import '../../../Director/verify_event.dart';
import 'package:glbapp/pages/HomeScreen/notifications/notificationScreen.dart';

import 'itemPages/Notes.dart';


class HomePage extends StatefulWidget {
  final int role;
  const HomePage({required this.role}) ;




  @override
  _HomePageState createState() => _HomePageState(role:role);
}

class _HomePageState extends State<HomePage> {
  final int role;
   _HomePageState({required this.role});


  final database=FirebaseDatabase.instance.reference();
  //User? user = FirebaseAuth.instance.currentUser;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;


  @override
  Widget build(BuildContext context) {
    print(this.role);
    final user=FirebaseAuth.instance.currentUser;
    final dailySpecialRef=database.child('/notification');
    Size size = MediaQuery.of(context).size;
   // print(user!.email);
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

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>Notification_Event()
                        ));
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FloatingActionButton.extended(
                      onPressed: () =>
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) =>EventForm()
                              )),
                      label: Text("Organise"),
                      backgroundColor: primaryBrown,
                      icon: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  Items(
                    imgName: "clubs",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>CollegeClubs()
                          ));
                    },
                    text: "College Clubs",
                  ),
                  Items(
                    imgName: "photo",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>PhotoGallery()
                          ));
                    },
                    text: "Photo Gallery",
                  ),
                  Items(
                    imgName: "contacts",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>Contact()
                          ));
                    },
                    text: "Contacts",
                  ),
                  Items(
                    imgName: "calender",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>TimeTable()
                          ));;
                    },
                    text: "Time Table",
                  ),
                  Items(
                    imgName: "feedback",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>AppFeedback()
                          ));
                    },
                    text: "Feedback",
                  ),
                  Items(
                    imgName: "notes",
                    press: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>Notes()
                          ));

                    },
                    text: "Notes",
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final nextorder=<String,dynamic>{
                        'description':'kya karrhe ho bsdk',
                        'price':9869,
                      };
                      database.child('orders').push().set(nextorder)
                      .then((value) => print('hogya '))
                      .catchError((onError)=> print('nai hua '));
                    }, child: Text('kjv'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/organise");


                    }, child: Text('kjv'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Event()));

                     }                ,
                    child: Text('kjv'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify()));

                    }                ,
                    child: Text('kjv'),
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
