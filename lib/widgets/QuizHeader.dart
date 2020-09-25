import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {

   final int score;
   final int current;

  const QuizHeader({
    this.current,
    this.score
  });


  @override
  Widget build(BuildContext context) {
    const double  size = 17;
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Pregunta ${current + 1} de 5", style: TextStyle(fontSize: size),),
        Text("Puntaje $score", style: TextStyle(fontSize: size))
      ],),
    );
  }
}