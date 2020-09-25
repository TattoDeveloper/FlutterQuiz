import 'package:flutter/material.dart';
import 'package:parcial/models/StateModel.dart';
import 'package:parcial/widgets/Quiz.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFB2EBF2).withOpacity(0.9),
       appBar: AppBar(
         title: Text("Trivia", style: TextStyle(
           fontSize: 25
         ),),
         centerTitle: true,
         backgroundColor: Color(0xFF0097A7),
       ),
       body: Quiz(),
    );
  }
}