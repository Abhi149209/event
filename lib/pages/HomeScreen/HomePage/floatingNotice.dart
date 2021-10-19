import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class FloatingNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<int> colors = <int>[900, 800, 700, 600, 500, 400, 300, 200, 100];
    return Container(
      height: size.height * .3,
      child: ListView.separated(
          padding: EdgeInsets.only(left: 40),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print(index); //here we will be adding on tap option
              },
              child: (Container(
                width: size.width * .7,
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(
                    "Notice " + (index + 1).toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage(''), fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                        color: secondaryYellow,
                      ),
                    ],
                    //color: Colors.blue[colors[index]],
                    borderRadius: BorderRadius.circular(70)),
              )),
            );
          },
          separatorBuilder: (context, _) => SizedBox(
                width: 12,
              ),
          itemCount: colors.length),
    );
  }
}
