import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class TimeTable extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(children: [
            Image.asset('assets/images/timetable.png'),
            SizedBox(height: 20),
            Text(
              'Timetable Being Uploaded...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
