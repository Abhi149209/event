import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class CollegeClubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBrown,
          elevation: 4.0,
          toolbarHeight: 70,
          title: Text("College Clubs"),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 70),
                  child: Text(
                    'GDSC',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 40),
                  child: Text(
                    'Erudite Room',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 40),
                  child: Text(
                    'Rotaract Club',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 40),
                  child: Text(
                    'Achievers Club',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 40),
                  child: Text(
                    'Innovation Club',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 10.0,
              child: Stack(children: <Widget>[
                Image.asset(
                  'assets/images/book.png',
                  height: 170,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.only(top: 152, left: 40),
                  child: Text(
                    'Student Society',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
