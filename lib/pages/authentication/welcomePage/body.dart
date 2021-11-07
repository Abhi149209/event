import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:glbapp/pages/authentication/adminlogin/adminlogin.dart';
import 'package:glbapp/pages/authentication/welcomePage/background.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glbapp/pages/authentication/Auth/firebase.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:provider/provider.dart';




class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  late String email;


  @override
  void initState() {
    super.initState();
    //signOutGoogle();
  }


  void click() {
    print("Signing with google clicked------>");
    // signInWithGoogle().then((user) {
    //   // this.user = user!;
    //   print(user);
    //   print("Signed in succesfully---------->");
    //   if(user.user!.email!.contains("glbitm.ac.in")){
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => AdminLogin()));
    //
    //
    //   }else{
    //     ////signOutGoogle();
    //     Fluttertoast.showToast(msg: "Only Official GLBITM accounts are allowed");
    //     print("nikal laude");
    //
    //   }



    // }).catchError((error) {
    //   print('Registration Error: $error');
    // });
    final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
    provider.signInWithGoogle();

  }
  @override
  Widget build(BuildContext context) {
    print("agya welcome page pe");

    return WelcomeBackground(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Text(
                "WELCOME TO GLBITM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text(
                "FIND YOUR SPARK",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              // Image.asset(
              //   "assets/images/book.png",
              //   height: size.height * .30,
              // ),
              SvgPicture.asset(
                "assets/images/books.svg",
                //fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height*0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),


            OutlinedButton(
                onPressed: this.click,
                style: OutlinedButton.styleFrom(
                  backgroundColor:  Color(0xff902525),
//splashColor: Colors.grey,
                  shadowColor: Colors.grey,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),

// BorderSide: BorderSide(color: Colors.grey),

                ),


                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage('assets/images/google_logo.png'), height: 35),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Sign in with Google',
                                style: TextStyle(color: Colors.white, fontSize: 25)))
                      ],
                    ))),



            SizedBox(height: MediaQuery.of(context).size.height*0.05),

            ],
          ),
        ),
      ),
    );
  }
}
