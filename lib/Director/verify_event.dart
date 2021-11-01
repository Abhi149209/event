import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Notifiaction_event/email_generator.dart';
import 'PermissionCard.dart';
import 'package:glbapp/constrants.dart';
class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _database=FirebaseDatabase.instance.reference();
  final String body='Thank you for registering your event. Director/HOD office has viewed your request and granted Permission for so. ';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: _database.child('/organisers').orderByKey().limitToLast(10).onValue,
              builder: (context,snapshot) {
                final tilesList=<PermissionCard>[];
                if(snapshot.hasData){
                  final myOrders=Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
                  myOrders.forEach((key, value) {

                    final nextOrder=Map<String,dynamic>.from(value);
                    //print(_database.child('/organise/'));

                    // final orderTile=ListTile(
                    //
                    //
                    //   title: Text(nextOrder['description']),
                    //   subtitle: Text(nextOrder['name']),
                    //   onTap: () async {
                    //     nextOrder['verified']=1;
                    //     _database.child('/verified').push().set(nextOrder)
                    //         .then((value) => print('hogya '))
                    //         .catchError((onError)=> print('nai hua '));
                    //     _database.child('event_details').push().set({'date': nextOrder['date']});
                    //     Send(topic:nextOrder['topic'],date:nextOrder['date'],slot:nextOrder['date'],description:nextOrder['description'],body:body,email:nextOrder['emailId'], ).send();
                    //
                    //   },
                    // );
                    final Card=PermissionCard(
                        AcceptPress:() async {
                                  nextOrder['verified']=1;

                                 _database.child('/verified').push().set(nextOrder)
                                 .then((value) => print('hogya '))
                                  .catchError((onError)=> print('nai hua '));
                                 _database.child('event_details').push().set({'date': nextOrder['date']});
                                  Send(topic:nextOrder['topic'],date:nextOrder['date'],slot:nextOrder['date'],description:nextOrder['description'],body:body,email:nextOrder['emailId'], ).send();


                                  

                            },
                        DeclinePress:() {
                          nextOrder['declined']=1;
                          _database.child('/declined').push().set(nextOrder)
                              .then((value) => print('hogya '))
                              .catchError((onError)=> print('nai hua '));
                        },
                        Title: nextOrder['topic'].toString(),
                        Date: nextOrder['date'].toString(),
                        Time: nextOrder['date'].toString(),
                      Venue: nextOrder['venue'].toString(),
                      uniqueId: nextOrder['uniqueId'].toString(),
                      email: nextOrder['emailId'].toString(),
                      Description: nextOrder['description'].toString(),
                      name: nextOrder['name'],


                     // color: secondaryYellow,




                    );

                    nextOrder['verified']==0?tilesList.add(Card):null;

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
