import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glbapp/pages/HomeScreen/homeScreen.dart';
import 'package:glbapp/pages/authentication/adminlogin/background.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';

class AdminBody extends StatelessWidget {
  int role=0;
  String pin="";
  TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(' Pin '),
            actions: [
              TextButton(
                child: Text("YES"),
                onPressed: () {
                  //Put your code here which you want to execute on Yes button click.
                  if(pin=="0000"){
                    role=2;
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomeScreen(role: role)));
                  }
                  else if(pin=="1234"){
                    role=1;
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomeScreen(role: role)));

                  }
                  else{

                    Fluttertoast.showToast(msg: "wrong pin");

                  }

                },
              ),
            ],
            content: TextField(
              onChanged: (value) {
                   pin=value;
                   print(pin);

                },










              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
          );
        });


  }

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
                press: () => {
                  _displayTextInputDialog(context),


                },
              ),
              SizedBox(
                height: 20,
              ),
              CircularButton(
                text: "Student",
                color: Color(0xfffac439),
                textColor: Colors.black,
                press: () =>Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen(role: role))),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
//
//
// final snackBar = SnackBar(content: Text('wrong pin!'));
//
// ScaffoldMessenger.of(context).showSnackBar(snackBar);