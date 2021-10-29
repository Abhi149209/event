import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Schema.dart';

class Organise_Event_form extends StatefulWidget {
  @override
  _Organise_Event_formState createState() => _Organise_Event_formState();
}

class _Organise_Event_formState extends State<Organise_Event_form> {
  final _database=FirebaseDatabase.instance.reference();
  late final String description;
  late final String name;
  late final String uniqueId;
  late final String topic;
  late final int date;
  late final int time;
  late final int tenure;
  void _inputUserEventData(){
    final nextEvent=<String,dynamic>{
      'description': "lorem iosum",'verified':0, 'name': 'abhinav sahai ', 'uniqueId': 'me19112', 'date': 3456, 'tenure': 2, 'time': 1234, 'topic': 'kuch bhi'
    };
    _database.child('/organisers').push().set(nextEvent)
        .then((value) => print('hogya '))
        .catchError((onError)=> print('nai hua '));


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('j'),
        onPressed: () async {
          _inputUserEventData();

        },
      ),

    ) ;
  }

}
