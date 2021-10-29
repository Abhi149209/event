import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:glbapp/constrants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:glbapp/pages/authentication/widget/button.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:form_field_validator/form_field_validator.dart';


class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");


  final _database=FirebaseDatabase.instance.reference();
   String description="";
   String name="";
   String uniqueId="";
   String topic="";
   String S="";
   String time="";
   String tenure="";
   String venue="";
   String email="";
  DateTime currentDate = DateTime.now();
  final List<Map<String, dynamic>> _time = [
    {
      'value': 'A',
      'label': '09:00 AM - 02:00 PM',

    },
    {
      'value': 'B',
      'label': '03:00 PM - 07:00 PM',


    },
    {
      'value': 'C',
      'label':'Not Selected',
    }

  ];


  final List<Map<String, dynamic>> _items = [
    {
      'value': 'SBG',
      'label': 'SBG Hall',

    },
    {
      'value': 'Audi 1',
      'label': 'Audi 1',


    },
    {
      'value': 'Audi 2',
      'label': 'Audi 2',

    },
    {
      'value': 'Audi 3',
      'label': 'Audi 3',
    },
    {
      'value': 'Audi 4',
      'label': 'Audi 4',
    },
    {
      'value':'Not Selected',
      'label' : 'Not Selected',
    }

  ];
  List userList = [];
  bool ok=true;
  int inte=0;

  Future<void> check(String time)async {
    ok=true;

    await _database.child('event_details').once().then((DataSnapshot snapshot){
      print("aya2");
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        if(values["date"]==time) ok=false;
        //print(values["date"]);
       // if(values["date"]==time) ok=false;

        print(time);
        print(values["date"]);
        // here insert all the user into a list
        userList.add(values["dates"]);

        });
    });

      inte=1;














  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        S=currentDate.toString();

      });
  }
  Future<void> _inputUserEventData() async {
    final nextEvent=<String,dynamic>{
      'description': description,'verified':0, 'name': name, 'uniqueId': uniqueId, 'date':S, 'tenure': tenure, 'topic': topic,'venue':venue,'emailId':email
    };
    _database.child('/organisers').push().set(nextEvent)
        .then((value) => print("done"))
        .catchError((onError)=> print('nai hua '));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: primaryBrown,
          toolbarHeight: 70,
          title: Text("Organize your event!"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(

        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(

                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Text('To organize your event enter your details here. ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(

                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Name",
                            border: InputBorder.none,
                          ),
                          inputFormatters: [LengthLimitingTextInputFormatter(30)],
                          onChanged: (value) => setState(() {
                            name=value;
                          }),
                          validator:RequiredValidator(errorText: "Required Feild"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(

                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Email ID",
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => setState(() {
                            email=value;
                          }),
                          validator:  MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "Please enter a valid email address"),
                          ]),





                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => setState(() {
                            uniqueId=value;
                          }),
                          validator:RequiredValidator(errorText: "Required Field"),
                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Unique ID / Adm ID",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator:RequiredValidator(errorText: "Required Field"),
                          onChanged: (value) => setState(() {
                            topic=value;
                          }),
                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Name of the event/purpose",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: SelectFormField(
                          type: SelectFormFieldType.dropdown, // or can be dialog
                          initialValue: 'Not Selected',
                          icon: Icon(Icons.format_shapes),
                          labelText: 'Venue',
                          items: _items,
                          onChanged: (val) =>venue=val,
                          onSaved: (val) =>venue=val!,
                        ),
                      ),
//Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextFormField(
//     onChanged: (value) => setState(() {
//       venue=value;
//     }),
//     decoration: InputDecoration(
//       // fillColor: primaryBrown,
//       filled: true,
//       hintText: "Venue i.e SBG Hall, Audi-1,2,3,4",
//       border: InputBorder.none,
//     ),
//   ),
// ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
// ignore: deprecated_member_use


                          child: Expanded(
                            child: Row(
                              children: [
// TextFormField(
//
//
//
//
//
//   decoration: InputDecoration(
//     // fillColor: primaryBrown,
//
//     filled: true,
//     hintText: (S!="")?S:"Select Date",
//     border: InputBorder.none,
//   ),
// ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration:  BoxDecoration(
                                      color: Colors.white10,

                                    ),
                                    child: Text((S!="")?S:"Date in DD/MM/YYYY Format",style: TextStyle(fontSize: 17,color: Colors.grey),),
                                  ),
                                ),
                                IconButton(onPressed: ()async {
                                  _selectDate(context);
                                }, icon: Icon(Icons.calendar_today))
                              ],
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SelectFormField(
                          type: SelectFormFieldType.dropdown, // or can be dialog
                          initialValue:'C',
                          icon: Icon(Icons.format_shapes),
                          labelText: 'Select Slot',
                          items: _time,
                          onChanged: (val) =>(S[S.length-1]!='A' &&  S[S.length-1]!='B' ) ?S+=" " +val: S=S.substring(0, S.length-1) + val,
                          onSaved: (val) =>(S[S.length-1]!='A' &&  S[S.length-1]!='B' ) ?S+=" " +val!: S=S.substring(0, S.length-1) + val!,
                        ),
                      ),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextFormField(
//     onChanged: (value) => setState(() {
//       time=value;
//     }),
//
//     decoration: InputDecoration(
//       // fillColor: primaryBrown,
//       filled: true,
//       hintText: "Time 00:00 AM/PM",
//       border: InputBorder.none,
//     ),
//   ),
// ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator:RequiredValidator(errorText: "Required Field"),
                          onChanged: (value) => setState(() {
                            tenure=value;
                          }),
                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Tenure in hrs",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator:RequiredValidator(errorText: "Required Field"),
                          onChanged: (value) => setState(() {
                            description=value;
                          }),
                          maxLines: 6,
                          decoration: InputDecoration(
// fillColor: primaryBrown,
                            filled: true,
                            hintText: "Description",
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      TextButton(
                          style: TextButton.styleFrom(backgroundColor: primaryBrown),
                          onPressed: () async {
                            print(name);
                            print(description);
                            print(uniqueId);
                            print(tenure);
                            print(S);
                            print(venue);
                            print(topic);
                            print(email);



                            if(name!="" && description!="" && tenure!="" && S!="" && venue!="" && topic!="" && uniqueId!="" && email!="") {

                              print("aya");
                              await check(S);




                            }



                          },
                          child: Text("Save Changes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                      TextButton(onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print("Process data");

                        } else {
                        print('Error');
                        }
                        if(inte==1 && ok) {
                          await _inputUserEventData();

                          final snackBar = SnackBar(
                            content: const Text('Slot is Booked , Verification Pending!'),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pop(context);




                        }
                        else if(!ok){
                          final snackBar = SnackBar(
                            content: const Text('Slot Not Available , already Booked! Try out with other slots'),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }, child: Text("confirm")),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

