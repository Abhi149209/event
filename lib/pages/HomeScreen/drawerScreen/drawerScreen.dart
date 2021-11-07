import 'dart:ui';
import 'package:glbapp/pages/authentication/welcomePage/Controller.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glbapp/Director/verify_event.dart';
import 'package:glbapp/constrants.dart';
import 'package:glbapp/pages/authentication/Auth/firebase.dart';
import 'package:glbapp/pages/authentication/welcomePage/welcome.dart';

class DrawerScreen extends StatefulWidget {
  final int role;

  const DrawerScreen({required this.role});

  @override
  _DrawerScreenState createState() => _DrawerScreenState(role: role);
}

class _DrawerScreenState extends State<DrawerScreen> {
  final int role;
  _DrawerScreenState({required this.role});
  @override
  Widget build(BuildContext context) {
    print(role);
    final user=FirebaseAuth.instance.currentUser;
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
              Text("Hello, ${user?.displayName}",
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
                  role==2?(InkWell(
                    child: Row(
                      children: [
                        //Icon(Icons.logout),
                        IconButton(onPressed: ()=>{

                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Verify())),

                        }, icon: Icon(Icons.verified_user_outlined)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("  Verify Events")
                      ],
                    ),
                  )):Text(""),
                  (role==2 || role==1)?(InkWell(
                    child: Row(
                      children: [
                        //Icon(Icons.logout),
                        IconButton(onPressed: ()=>{


                        }, icon: Icon(Icons.notification_add)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Add Notice")
                      ],
                    ),
                  )):Text(""),
                  (role==2|| role==1)?(InkWell(
                    child: Row(
                      children: [
                        //Icon(Icons.logout),
                        IconButton(onPressed: ()=>{


                        }, icon: Icon(Icons.access_time)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Update Timetable")
                      ],
                    ),
                  )):Text(""),
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
                        //Icon(Icons.logout),
                       OutlinedButton(onPressed: ()
                       {
                         final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
                         provider.signOutGoogle();
                         Navigator.push(
                             context, MaterialPageRoute(builder: (context) => Controller()));

                       }, child: Text("Logout")),
                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
