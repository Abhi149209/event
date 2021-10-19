import 'package:flutter/material.dart';
import 'package:glbapp/pages/authentication/adminlogin/background.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';

class AdminBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LoginBackground(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "WELCOME TO GLBITM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text(
                "FIND YOUR SPARK",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.06),
              Text(
                "You Are...?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: size.height * 0.02),
              CircularButton(
                text: "Faculty",
                color: Color(0xff902525),
                textColor: Colors.white,
                press: () => Navigator.pushNamed(context, "/adminsignup"),
              ),
              SizedBox(
                height: 20,
              ),
              CircularButton(
                text: "Student",
                color: Color(0xfffac439),
                textColor: Colors.black,
                press: () => Navigator.pushNamed(context, "/signup"),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
