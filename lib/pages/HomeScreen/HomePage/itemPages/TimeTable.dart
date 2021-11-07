import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';
import 'package:glbapp/pages/authentication/Timetable/branch.dart';

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
            TextButton(onPressed: () => Navigator.pushNamed(context, "/timetable2"), child: Text("timetable"))
            // GridView.builder(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemCount: 8,
            //   itemBuilder: (BuildContext context, int index) {
            //     return InkWell(
            //       onTap: () => Navigator.pushNamed(context, "/branch"),
            //       child: Card(
            //         color: secondaryYellow,
            //         margin: EdgeInsets.all(5),
            //         child: Center(
            //             child: Text("SEM " + (index + 1).toString(),
            //                 style: TextStyle(
            //                     fontSize: 30, fontWeight: FontWeight.bold))),
            //       ),
            //     );
            //   },
            // ),
          ]),
        ),
      ),
    );
  }
}
