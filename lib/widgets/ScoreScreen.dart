import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final Function handler;
   
  ScoreScreen({
    this.handler,
    this.score
  });

  @override
  Widget build(BuildContext context) {
    return Container(
         width: double.infinity,
         height: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Tu resultado es:", 
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,),),
             SizedBox(height: 20,),
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFFF5722),
               child: Text((score / 5).toString(), style: TextStyle(fontSize: 50,color:Colors.white),)
            ,),
            SizedBox(height: 20,),
            FlatButton(
              color: Color(0xFF009688),
              child: Text("Intentar de nuevo", style: TextStyle(color:Colors.white,)),
              onPressed: handler,
            )
            
       ],),);
  }
}