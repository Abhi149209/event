import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class AppFeedback extends StatelessWidget {
  const AppFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBrown,
          toolbarHeight: 70,
          title: Text("Feedback"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text('Your Feedback is important to us! ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  // fillColor: primaryBrown,
                  filled: true,
                  hintText: "Feedback",
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ))));
  }
}
