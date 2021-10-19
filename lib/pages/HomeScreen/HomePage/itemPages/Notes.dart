import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glbapp/constrants.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBrown,
          elevation: 4.0,
          toolbarHeight: 70,
          title: Text("Notes"),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: secondaryYellow,
              margin: EdgeInsets.all(5),
              child: Center(
                  child: Text((index + 1).toString(),
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            );
          },
        ));
  }
}
