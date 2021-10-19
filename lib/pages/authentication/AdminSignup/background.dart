import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget body;

  const LoginBackground({Key? key, required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/SignUpTop.png",
                width: size.width * 0.38),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/login_bt.png",
                width: size.width * 0.4),
          ),
          body,
        ],
      ),
    );
  }
}
