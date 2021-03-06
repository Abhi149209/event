import 'package:flutter/material.dart';
import 'package:glbapp/constrants.dart';
import 'package:firebase_database/firebase_database.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _database=FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          backgroundColor: primaryBrown,
          elevation: 4.0,
          toolbarHeight: 70,
          title: Text("Notifications"),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: _database.child('/verified').orderByKey().limitToLast(10).onValue,
              builder: (context,snapshot) {
                final tilesList=<ListTile>[];
                if(snapshot.hasData){
                  final myOrders=Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
                  myOrders.forEach((key, value) {

                    final nextOrder=Map<String,dynamic>.from(value);

                    final orderTile=ListTile(


                      title: Text(nextOrder['description']),
                      subtitle: Text(nextOrder['name']),

                    );
                    tilesList.add(orderTile);

                  });
                }
                return Expanded(child: ListView(children: tilesList,),

                );


              },

            ),
          ),
        )
    );
  }
}
