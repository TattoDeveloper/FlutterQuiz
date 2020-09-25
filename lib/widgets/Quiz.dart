import 'package:flutter/material.dart';
import 'package:parcial/models/StateModel.dart';
import 'package:parcial/util/QuestionServices.dart';
import 'package:parcial/widgets/FeedBack.dart';
import 'package:parcial/widgets/Question.dart';
import 'package:parcial/widgets/QuizHeader.dart';
import 'package:parcial/widgets/ScoreScreen.dart';


class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  
  int index = 0;
  bool isResponse = false;
  bool isEnded = false;
  bool questionState;
  int score = 0;
  List<Map> questionary;
  Map current;

 //inicializa el estado
  @override
  void initState() {
    // List<Map> questions = QuestionServices().getRandomFive();
    // setState(() {
    //   questionary = questions;
    //   current= questions[index];
    // });
    reset();
    super.initState();
  }

///este  es el método para responder
  void respond( bool value){
    
    bool answer = current["state"].testCapital(current['option']);
     bool state = answer == value;
     setState(() {
       isResponse=true;
       questionState = state;
       score = state ? score + 5 : score;
     });

  }

  void reset(){
     List<Map> questions = QuestionServices().getRandomFive();
     setState(() {
       index=0;
       isResponse=false;
       isEnded=false;
       score=0;
       questionary = questions;
       current= questions[index];
     });
  }


  void setIndex(){
    print(index);
    if(index < 4){
      setState(() {
          index= index + 1;
          isResponse= false;
          current= questionary[index];
         });
    }else{
      setState(() {
        isEnded = true;
      });
    }
  }
    

  @override
  Widget build(BuildContext context) {
   

    return isEnded ? ScoreScreen(score: score, handler:reset,)
           : Column(
              children: [
                Expanded(
                    child: QuizHeader(current: index, score: score,),  
                ),
                Expanded(
                    flex: 6,
                    child: isResponse == false ? Question(
                      question: 'La capital de ${current["state"].name} es:',
                      option: current['option'],
                    ) : FeedBackW(
                      question: 'La capital de ${current["state"].name} es:',
                      state: questionState,
                      correct: current["state"].capital,
                      handle: setIndex,
                    )
                ),
                Expanded(
                    child:Container(
                      width: double.infinity,
                      child: Row(children: [
                          QuizButton(
                              disabled: isResponse,
                              label: "False",
                              color: 0xFFFF5722,
                              handler: respond,),
                          QuizButton(
                              disabled: isResponse,
                              label: "Verdadero",
                              color: 0xFF009688,
                              handler: respond,
                              value: true,)
                      ],)
                    )
                )
              ],
            );
  }
}








//////////////////////////////////////////////////
class QuizButton extends StatelessWidget {
  final String label;
  final Function handler;
  final int color;
  final bool value;
  final bool disabled;

  const QuizButton({
      this.handler,
      this.label,
      this.color,
      this.value = false,
      this.disabled = false
  });


  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Container(
                 height: double.infinity,
                 child: FlatButton(
                 disabledColor: Colors.grey,
                 onPressed: disabled ? null : (){ handler(value);},
                 color: Color(color),
                 child:  Text(label, 
                           style: TextStyle(color: Colors.white, fontSize: 18),
                         ),
                    ),),);
  }
}