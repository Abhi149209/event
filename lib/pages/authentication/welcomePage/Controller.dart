import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/homepage.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:glbapp/pages/authentication/adminlogin/adminlogin.dart';
import 'package:glbapp/pages/authentication/welcomePage/body.dart';
import 'package:glbapp/pages/authentication/welcomePage/welcome.dart';

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    // print(user);
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              return Center(child: CircularProgressIndicator(),);
            else if(snapshot.hasData) {
              print("admin");
              print(snapshot);
              return AdminLogin();
            }
            else if(snapshot.hasError)
              return Center(child: Text('something went wrong '),);
            else{
              print("welcome1");

              return WelcomePage();
            }
          },

        )

    );
    // if(user==null){
    //
    //
    // }else{
    //   return HomeScreen(role: 0);
    // }

  }
}
