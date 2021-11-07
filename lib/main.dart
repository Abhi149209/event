// @dart=2.9
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/CollegeClubs.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/Contacts.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/Feedback.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/Notes.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/PhotoGallery.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/itemPages/TimeTable.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/about.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/contact.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/feedback.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:glbapp/pages/authentication/Auth/firebase.dart';
import 'package:glbapp/pages/authentication/adminlogin/adminlogin.dart';
import 'package:glbapp/pages/authentication/AdminSignup/adminsignup.dart';
import 'package:glbapp/pages/authentication/login/login.dart';
import 'package:glbapp/pages/authentication/signup/signup.dart';
import 'package:glbapp/pages/authentication/welcomePage/Controller.dart';
import 'package:glbapp/pages/authentication/welcomePage/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glbapp/pages/authentication/Timetable/branch.dart';
import 'package:glbapp/pages/authentication/Timetable/timetable.dart';


import 'package:glbapp/Notifiaction_event/organise.dart';
import 'package:glbapp/Notifiaction_event/notification.dart';
import 'package:glbapp/pages/HomeScreen/notifications/eventform.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(create: (context)=>GoogleSignInProvider(),
  child:
   MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "GLBITM App",
    //initialRoute: "/",
    home: Controller(),
//     routes: {
//       "/": (context) => WelcomePage(),
// //"/login": (context) => LoginPage(),
//       "/adminlogin": (context) => AdminLogin(),
//       "/adminsignup": (context) => AdminSignup(),
//       "/signup": (context) => SignupPage(),
//       "/homepage": (context) => HomeScreen(),
//       "/appourteam": (context) => AboutUs(),
//       "/appfeedback": (context) => AppFeedback(),
//       "/appcontactus": (context) => ContactUs(),
//       "/collgeclubs": (context) => CollegeClubs(),
//       "/contacts": (context) => Contacts(),
//       "/feedback": (context) => Check(),
//       "/notes": (context) => Notes(),
//       "/timetable": (context) => TimeTable(),
//       "/photogallery": (context) => PhotoGallery(),
//
//       "/organise":(context)=>Organise_Event_form(),
//       "/notification":(context)=>Notification_Event(),
//       "/eventform": (context) => EventForm(),
//       "/branch": (context) => Branch(),
//       "/timetable2": (context) => TimeTable2(),
//
//
//
//
//
//
//    },
  ));
}

