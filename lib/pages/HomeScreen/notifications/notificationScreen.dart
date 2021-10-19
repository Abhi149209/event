import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class NotificationScreen extends StatelessWidget {
  // const NotificationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 0,
      ),
      body: Center(
        child: Text("This is Notification Screen"),
      ),
    );
  }
}
