import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBrown,
        elevation: 4.0,
        toolbarHeight: 70,
        title: Text("Contacts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '''GL Bajaj Institute of Technology & Management
(Approved by A.I.C.T.E.,& Affiliated to Dr. A.P.J. Abdul Kalam Technical University (Formerly UPTU Lucknow)
                

Plot No.2 , APJ Abdul Kalam Road, Knowledge Park 3, Greater Noida
Uttar Pradesh, India.  Pin- 201306

B.Tech College in IndiaPhone No. : +91 7290008310  +91 7290008390 +91 120 2323818

(Time: 9:00AM to 4:30PM )
B.Tech College in Greater Noida Office@glbitm.ac.in''',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ])),
      ),
    );
  }
}
