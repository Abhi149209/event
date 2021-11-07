import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class Branch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 4.0,
        toolbarHeight: 70,
        title: Text("Timetable"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: secondaryYellow,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Branch " + (index + 1).toString(),
                      style: TextStyle(
                        color: primaryBrown,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  )));
        },
      ),
    );
  }
}