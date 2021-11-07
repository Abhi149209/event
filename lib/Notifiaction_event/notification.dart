//  import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'NotificationCard.dart';
// class Notification_event extends StatefulWidget {
//   @override
//   _Notification_eventState createState() => _Notification_eventState();
// }
//
// class _Notification_eventState extends State<Notification_event> {
//   final _database=FirebaseDatabase.instance.reference();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: Container(
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: StreamBuilder(
//               stream: _database.child('/verified').orderByKey().limitToLast(10).onValue,
//               builder: (context,snapshot) {
//                 final tilesList=<NotificationCard>[];
//                 if(snapshot.hasData){
//                   final myOrders=Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
//                   myOrders.forEach((key, value) {
//
//                     final nextOrder=Map<String,dynamic>.from(value);
//
//                     final orderTile=NotificationCard(name: nextOrder['name'], description:nextOrder['description'], venue: nextOrder['venue'], date: nextOrder['date'], topic:nextOrder['topic'], tenure: nextOrder['tenure'], slot: nextOrder['date']);
//                     tilesList.add(orderTile);
//
//                   });
//                 }
//                 return Expanded(child: ListView(children: tilesList,),
//
//                 );
//
//
//               },
//
//             ),
//           ),
//         )
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:glbapp/Director/PermissionCard.dart';
import 'package:glbapp/Notifiaction_event/email_generator.dart';
import 'NotificationCard.dart';
import 'package:glbapp/constrants.dart';

class Notification_Event extends StatefulWidget {
  @override
  _Notification_EventState createState() => _Notification_EventState();
}

class _Notification_EventState extends State<Notification_Event> {
  late Query _ref;
  late String user;
  late String s;
  final String body='Thank you for registering your event. Director/HOD office has viewed your request and granted Permission for so. ';

  DatabaseReference _database =
  FirebaseDatabase.instance.reference();
  DatabaseReference reference =
  FirebaseDatabase.instance.reference().child('/verified');


  Future<bool> check(String time)async {
    bool ok=false;


    await _database.child('user_details_for_registration/$user').once().then((DataSnapshot snapshot){
      print("aya2");

      Map<dynamic, dynamic> values = snapshot.value;
      if(!snapshot.exists) return false;
      values.forEach((key,values) {
        if(key==time) ok=true;
        print(values);
        print(key);
        //print(values["date"]);
        // if(values["date"]==time) ok=false;


        // here insert all the user into a list
        //userList.add(values["dates"]);

      });

    });










  return ok;





 }
  Future<bool> rootFirebaseIsExists(String databaseReference) async{


    DataSnapshot snapshot = await _database.child(databaseReference).once();

    print(snapshot.value);
    print(snapshot.key);

    return snapshot.value != null;
  }

  @override
  void initState() {


    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/verified')
        .orderByChild('name');
  }


  Widget _buildContactItem({required Map nextOrder, required int count,required int ok}) {
    final user1=FirebaseAuth.instance.currentUser;
    user=user1!.displayName!;
    //var count=reference
      //  .child(nextOrder['key']).child('registration');





    //Color typeColor = getTypeColor(contact['type']);
    return NotificationCard
      (



        name: nextOrder['name'],
       date: nextOrder['date'],
      description: nextOrder['description'],
      tenure: nextOrder['tenure'],
      slot: nextOrder['date'],
      topic: nextOrder['topic'],
      venue: nextOrder['venue'],
      // req: reference
      //     .child(nextOrder['key'])
      //     .update({'registrations':count}),
        tb:ok==1? FloatingActionButton.extended(
            onPressed: () async =>{
            s=nextOrder['date'],

            s=s.substring(0,11)+" "+nextOrder['topic'],


                print(nextOrder),



                if(await check(s) ==false){

                  reference
                      .child(nextOrder['key'])
                      .update({'registrations':count+1}).whenComplete(() => ok=0),

                  _database.child('/user_details_for_registration/$user/$s').set(nextOrder).then((value) => print('hogya 1st '))
                      .catchError((onError)=> print('nai hua 1st')),
                  _database.child('/event_registration_user_detials/$s').push().set({'name':user}).then((value) => print('hogya 2nd'))
                      .catchError((onError)=> print(onError.toString())),

                }else if(await check(s)==true){
                  print("katt gya"),
                  _showDeleteDialog(),



                }


                },
                label: Text("Register"),
                backgroundColor: primaryBrown,
                 icon: Icon(Icons.add),
               ):null,


    );
  }

  _showDeleteDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('You are already Registered for the event'),
            content: Text(''),

          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            //final nextOrder=Map<String,dynamic>.from(value);
            Map contact = snapshot.value;
            contact['key'] = snapshot.key;
            var count=snapshot.value['registrations'];
            int ok=1;

            return _buildContactItem(nextOrder: contact,count:count,ok: ok);
          },
        ),
      ),

    );
  }

}