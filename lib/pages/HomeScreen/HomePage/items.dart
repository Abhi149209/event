import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Items extends StatelessWidget {
  //const Items({ Key? key }) : super(key: key);
  final String? text;
  final String? imgName;
  final VoidCallback? press;

  const Items({Key? key, this.text, this.imgName, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ]),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 18, right: 18, bottom: 15),
      child: Center(
        child: ListTile(
          onTap: press,
          leading: SvgPicture.asset(
            "assets/images/$imgName.svg",
            height: size.height * .03,
          ),
          title: Text(
            "$text",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
