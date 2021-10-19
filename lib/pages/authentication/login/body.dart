import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glbapp/pages/authentication/login/background.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';
import 'package:glbapp/pages/authentication/widget/circular_text_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            SizedBox(height: size.height * .05),

            SvgPicture.asset(
              "assets/images/loginpage.svg",
              //fit: BoxFit.cover,
              height: size.height * .30,
            ),
            // Image.asset(
            //   "assets/images/book.png",
            //   fit: BoxFit.fitWidth,
            //   height: size.height * .35,
            // ),

            SizedBox(height: size.height * 0.05),
            //container

            RoundedTextField(
              color: Color(0xff902525),
              icon: Icons.email,
              keyType: TextInputType.emailAddress,
              text: "Your Email",
              privacy: false,
              suffixicon: null,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedTextField(
              keyType: TextInputType.text,
              color: Color(0xff902525),
              icon: Icons.lock,
              text: "Your Password",
              privacy: true,
              suffixicon: Icons.remove_red_eye,
            ),

            SizedBox(height: size.height * 0.02),
            CircularButton(
              text: "LOGIN",
              color: Color(0xff902525),
              textColor: Colors.white,
              press: () {
                Navigator.pushNamed(context, "/homepage");
              },
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(color: Color(0xff092525)),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/signup"),
                  child: Text("Sign Up",
                      style: TextStyle(
                        color: Color(0xff902525),
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
