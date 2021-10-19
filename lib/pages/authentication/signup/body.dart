import 'package:flutter/material.dart';
import 'package:glbapp/pages/authentication/signup/background.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';
import 'package:glbapp/pages/authentication/widget/circular_text_field.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return Background(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Here's your first step with us!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.black),
            ),
            SizedBox(height: size.height * .02),

            // SvgPicture.asset(
            //   "assets/images/signpage.svg",
            //   //fit: BoxFit.cover,
            //   height: size.height * .30,
            // ),
            SizedBox(height: size.height * 0.02),
            RoundedTextField(

              color: Color(0xff902525),
              icon: Icons.person,
              keyType: TextInputType.name,
              text: "Your Name",
              privacy: false,
              suffixicon: null,

            ),
            SizedBox(height: size.height * 0.02),

            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.list,
              keyType: TextInputType.number,
              text: "Unversity Roll Number",
              privacy: false,
              suffixicon: null,

            ),
            SizedBox(height: size.height * 0.02),

            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.calendar_today_rounded,
              text: "Year",
              keyType: TextInputType.number,
              privacy: false,
              suffixicon: null,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.class_,
              text: "Branch",
              keyType: TextInputType.text,
              privacy: false,
              suffixicon: null,
            ),
            SizedBox(height: size.height * 0.02),

            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.mail,
              keyType: TextInputType.emailAddress,
              text: "College Mail",
              privacy: false,
              suffixicon: null,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.lock,
              text: "Your Password",
              keyType: TextInputType.text,
              privacy: true,
              suffixicon: Icons.remove_red_eye,
            ),

            SizedBox(height: size.height * 0.03),
            CircularButton(
              text: "SIGN UP",
              color: Color(0xff902525),
              textColor: Colors.white,
              press: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/login"),
                  child: Text("Sign In",
                      style: TextStyle(
                        color: Color(0xff902525),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),

            SizedBox(height: size.height * 0.02),
          ]),
        ),
      ),
    );
  }
}
