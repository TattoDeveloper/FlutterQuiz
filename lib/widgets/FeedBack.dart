import 'package:flutter/material.dart';

class FeedBackW extends StatelessWidget {
  
  final String question;
  final bool state;
  final String correct;
  final Function handle;
  
  const FeedBackW(
    {
      this.state,
      this.question,
      this.correct,
      this.handle
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
         Icon(
            state == true ? Icons.check : Icons.close,
            size: 60,
            color: state == true ? Colors.green : Colors.red,
         ),
         SizedBox(height: 30,),
         Text(question, style: TextStyle(fontSize: 20),),
         SizedBox(height: 10,),
         Text(correct, style: TextStyle(fontSize: 25)),
         SizedBox(height: 30,),
         FlatButton(
            color: Color(0xFF0097A7),
            child: Text("Continuar"),
            onPressed: handle,
          )
      ],),
    );
  }
}