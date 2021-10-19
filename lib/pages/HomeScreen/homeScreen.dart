import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/homepage.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/drawerScreen.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomePage()],
      ),
    );
  }
}
