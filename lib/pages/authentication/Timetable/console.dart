import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class Console extends StatefulWidget {
  const Console({Key? key}) : super(key: key);

  @override
  _ConsoleState createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  String sem='1';
  String branch='ME';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: ()=>{}, child: Text("Update TimeTable")),
          Container(
            child: InkWell(
              child: Text("Tap for TimeTable"),
              onTap: ()=>launch("")
            ),

           )
        ],
      ),
    );
  }
}
