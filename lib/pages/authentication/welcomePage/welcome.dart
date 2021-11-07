import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/homepage.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:glbapp/pages/authentication/adminlogin/adminlogin.dart';
import 'package:glbapp/pages/authentication/welcomePage/body.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
   // print(user);
    return Scaffold(
      body: Body()

    );
    // if(user==null){
    //
    //
    // }else{
    //   return HomeScreen(role: 0);
    // }

  }
}
