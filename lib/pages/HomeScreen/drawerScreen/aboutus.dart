import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class AboutUs extends StatelessWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 4.0,
        toolbarHeight: 70,
        title: Text("About Us"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                primaryBrown,
                secondaryYellow,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
                child: Column(
              children: [
                ClipOval(
                  child: Image.asset('assets/images/book.png',
                      fit: BoxFit.cover, width: 150, height: 150),
                ),
                SizedBox(height: 10),
                Text('Anmol Gangwar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
            Container(
                child: Column(
              children: [
                ClipOval(
                  child: Image.asset('assets/images/book.png',
                      fit: BoxFit.cover, width: 150, height: 150),
                ),
                SizedBox(height: 10),
                Text('Saumya Shrivastava',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
            Container(
                child: Column(
              children: [
                ClipOval(
                  child: Image.asset('assets/images/book.png',
                      fit: BoxFit.cover, width: 150, height: 150),
                ),
                SizedBox(height: 10),
                Text('Tanay Gupta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
            Container(
                child: Column(
              children: [
                ClipOval(
                  child: Image.asset('assets/images/book.png',
                      fit: BoxFit.cover, width: 150, height: 150),
                ),
                SizedBox(height: 10),
                Text('Abhinav Sahai',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
