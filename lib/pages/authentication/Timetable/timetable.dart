import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glbapp/constrants.dart';

class TimeTable2 extends StatelessWidget {
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
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(context, "/branch"),
              child: Card(
                color: secondaryYellow,
                margin: EdgeInsets.all(5),
                child: Center(
                    child: Text("SEM " + (index + 1).toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
              ),
            );
          },
        ));
  }
}