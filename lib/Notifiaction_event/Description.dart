import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String? name;
  final String? description;
  final String? date;
  final String? slot;
  final String? topic;
  final String? tenure;
  final String? venue;


  const Description(
      {Key? key,


        required this.name,

        // required this.email,


        required this.description,
        required this.venue,
        required this.date,
        required this.topic,
        required this.tenure,

        // required this.color,
        required this.slot
      })

      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(description!),
    );
  }
}
