import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _database=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: _database.child('/organisers').orderByKey().limitToLast(10).onValue,
              builder: (context,snapshot) {
                final tilesList=<ListTile>[];
                if(snapshot.hasData){
                  final myOrders=Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
                  myOrders.forEach((key, value) {

                    final nextOrder=Map<String,dynamic>.from(value);

                    final orderTile=ListTile(


                      title: Text(nextOrder['description']),
                      subtitle: Text(nextOrder['name']),
                      onTap: () async {
                        nextOrder['verified']=1;
                        _database.child('/verified').push().set(nextOrder)
                            .then((value) => print('hogya '))
                            .catchError((onError)=> print('nai hua '));
                        _database.child('event_details').push().set({'date': nextOrder['date']});
                      },
                    );
                    nextOrder['verified']==0?tilesList.add(orderTile):null;

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
