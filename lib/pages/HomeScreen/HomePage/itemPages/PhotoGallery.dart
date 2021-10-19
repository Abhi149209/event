import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

import 'gallery.dart';

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 4.0,
        toolbarHeight: 70,
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(a[index]);
        },
      ),
    );
  }
}
