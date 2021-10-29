import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  String _displayText='results';
  final _database=FirebaseDatabase.instance.reference();
  @override
  void initState(){
    super.initState();
   // _activateListeners();
    _performSingleFetch();


  }
  void _performSingleFetch(){
    _database.child('orders').once().then((snapshot) {
      final data =new Map<String,dynamic>.from(snapshot.value);
      final description=data['description'] as String;
     // final price =data['kaam'] as String;
      setState(() {
        _displayText='todays:$description ';
      });
    });

  }
  void _activateListeners(){
    _database.child('notification').onValue.listen((event) {
      final data =new Map<String,dynamic>.from(event.snapshot.value);
      final description=data['name'] as String;
      final price =data['kaam'] as String;
      setState(() {
        _displayText='todays:$description and $price';
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: _database.child('orders').orderByKey().limitToLast(10).onValue,
            builder: (context,snapshot) {
              final tilesList=<ListTile>[];
              if(snapshot.hasData){
                final myOrders=Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
                myOrders.forEach((key, value) {
                  final nextOrder=Map<String,dynamic>.from(value);
                  final orderTile=ListTile(

                    title: Text(nextOrder['description']),
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
