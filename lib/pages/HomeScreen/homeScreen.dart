import 'package:flutter/material.dart';
import 'package:glbapp/pages/HomeScreen/HomePage/homepage.dart';
import 'package:glbapp/pages/HomeScreen/drawerScreen/drawerScreen.dart';

class HomeScreen extends StatelessWidget {
  final int role;
  const HomeScreen({ required this.role });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(role:  role,), HomePage(role: role,)],
      ),
    );
  }
}
