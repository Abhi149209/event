import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 4.0,
          toolbarHeight: 70,
          title: Text("Contact Us"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  secondaryYellow,
                  primaryBrown,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('How Can We Help You?',
                        style: TextStyle(
                          color: primaryBrown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      // fillColor: primaryBrown,
                      filled: true,
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "E-mail",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Phone No.",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Query",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ])),
        ));
  }
}
