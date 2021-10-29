 import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Notification_event extends StatefulWidget {
  @override
  _Notification_eventState createState() => _Notification_eventState();
}

class _Notification_eventState extends State<Notification_event> {
  final _database=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
