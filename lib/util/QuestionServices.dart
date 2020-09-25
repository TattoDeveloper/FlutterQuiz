
import 'dart:math';
import 'package:parcial/models/StateModel.dart';
import 'data.dart';

class QuestionServices{
    
    List<Map<String,dynamic>> getRandomFive(){
        List<StateModel> listStates = getStates();
        //List<String> listCapitals = getCapitals();
        return _buildQuestionaryWithRestiction(listStates);//_buildQuestionary(listStates, listCapitals);
    }

    List _buildQuestionaryWithRestiction(List<StateModel> states){
         List<String> capitals = getCapitals();
         List<Map<String,dynamic>> tmp=[];
         int rand = Random().nextInt(states.length - 3);
          for(int i=0; i < states.length; i++){
            tmp.add({
              "state": states[i],
              "option" : i < 2  ? states[i].capital :  capitals[i - 2]
            });
          }

        return tmp; 
    }

    // List<String> _getCapitals(List<StateModel> states){
    //    List<String> tempCapitals = [];
    //    states.forEach((element) {
    //         tempCapitals.add(element.capital);
    //     });
    //     String capital = getRandom()['capital'];
    //     tempCapitals.replaceRange(1, 2, [capital]);

    //     return tempCapitals;
    // }

    // List<Map<String,dynamic>> _buildQuestionary(List<StateModel> states, List<String> capitals){
    //     List<Map<String,dynamic>> tmp=[];
    //     for(int i=0; i < states.length; i++){
    //        tmp.add({
    //          "state": states[i],
    //          "option" : capitals[i]
    //        });
    //     }

    //     return tmp;
    // }
   
    List<StateModel> getStates(){
       List<StateModel> tmpList = [];
       while(tmpList.length < 5){
           Map element = getRandom();
           bool includes = exist(tmpList, element);
           if(!includes){
              tmpList.add(StateModel.fromMap(element));
           }
       }
       return tmpList;
    }

    List<String> getCapitals(){
      List<String> tmpList = [];

      while(tmpList.length < 3){
        String element = getRandom()['capital'];
        bool includes = exist(tmpList, element);
        if(!includes){
          tmpList.add(element);
        }
      }

       return tmpList;
    }

    dynamic getRandom(){
        int rand = Random().nextInt(states.length -1);
        Map element  = states[rand];
        return element;
    }

    bool exist(List list, dynamic element){
       for(int i=0; i < list.length;i++){
            if(element == list[i]){
              return true;
            }
       }
       return false;
    }
    
}