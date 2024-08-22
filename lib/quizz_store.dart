import 'package:flutter/material.dart';
///This file/class stores all the necessary items of our quiz app (quizzler)

class Quiz{
  String question;
  bool answer;
  Quiz({required this.question,required this.answer});
}


/// an abstraction layer to manage our quiz app more securely.
class QuizManager {
  final List<Quiz> _questionAnswers = [
    Quiz(question: "Question 1", answer: true),
    Quiz(question: "Question 2", answer: false),
    Quiz(question: "Question 3", answer: false),
    Quiz(question: "Question 4", answer: true),
    Quiz(question: "Question 5", answer: false),
    Quiz(question: "Question 6", answer: true),
    Quiz(question: "Question 7", answer: false),
    Quiz(question: "Question 8", answer: true),
    Quiz(question: "Question 9", answer: false),
    Quiz(question: "Question 10", answer: false),
  ];
  int _questionNumber = 0;
  int _score = 0;

  ///get next question number:
  void getNextQuestion(){
    _questionNumber++;
  }

  ///get the actual question.
  String getQuestion() {
    if (_questionNumber > _questionAnswers.length - 1) {
      return 'You Scored: $_score out of ${_questionAnswers.length}';
    }
    return  _questionAnswers[_questionNumber].question;
  }

  ///private method to check the answers
  bool _checkAnswer(){
    return _questionAnswers[_questionNumber].answer;
  }

  final List<Icon> _resultWidgets = [];
  ///get the answers to be displayed.
  void getAnswer({required bool isTruePressed}) {
    if(_questionNumber>_questionAnswers.length-1){
       ///don nothing
      return ;
    }
    bool answer = _checkAnswer();
    if (answer == isTruePressed) {
      _score++;
      _resultWidgets.add(const Icon(Icons.check_box,color: Colors.greenAccent,));
    } else {
      _resultWidgets.add(const Icon(Icons.cancel,color: Colors.redAccent,));
    }
  }

  /// can get answer, but can't set it.
  List<Widget> showAnswers(){
    return _resultWidgets;
  }

}

