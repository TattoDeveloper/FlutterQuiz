import 'package:flutter/material.dart';
import 'package:parcial/models/StateModel.dart';

class Question extends StatelessWidget {
   
   final String question;
   final String option;

  const Question({
    this.question,
    this.option
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(children: [
          Text(
             question,
             style: TextStyle(fontSize: 23),
          ),
          SizedBox(height:20,),
          Text(option,
            style: TextStyle(fontSize: 40),
          )
        ],),
    );
  }
}