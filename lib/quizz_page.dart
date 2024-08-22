import 'package:flutter/material.dart';
import 'package:quizzler/quizz_store.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int questionNumber = 0;
  var questionAnswers = [
  Quiz(question: "Question 1", answer: true),
  Quiz(question: "Question 2", answer: false),
  Quiz(question: "Question 3", answer: false),
  Quiz(question: "Question 4", answer: true),
  Quiz(question: "Question 5", answer: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                getQuestions(),
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    color: Colors.red,
                    height: 50.0,
                    width: 100.0,
                    child: TextButton(
                      onPressed: () {
                        //Todo:show next question.
                        //Todo:check answer and update answer field.
                        getAnswers(isTruePressed: false);
                        setState(() {
                          questionNumber++;
                        });
                      },
                      child: const Center(child: Text('False',style: TextStyle(color: Colors.white,fontSize: 18.0),),),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    color: Colors.green,
                    height: 50.0,
                    width: 100.0,
                    child: TextButton(
                      onPressed: () {
                        //Todo:show next question.
                        //Todo:check answer and update answer field.
                        getAnswers(isTruePressed: true);
                          setState(() {
                            questionNumber++;
                          });
                      },
                      child: const Center(child: Text('True',style: TextStyle(color: Colors.white,fontSize: 18.0),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: resultWidgets,
            ),
          ),
        ],
      )),
    );
  }

  String getQuestions() {
    if (questionNumber > questionAnswers.length - 1) {
      return 'Quiz ended.';
    }
    var question = questionAnswers[questionNumber].question;
    return question;
  }

  List<Icon> resultWidgets = [];
  List<Icon> getAnswers({required bool isTruePressed}) {
    debugPrint('questionNumber: $questionNumber');
    if (questionNumber > questionAnswers.length - 1) {
      resultWidgets.clear();
      setState(() {
        ///clear result section.
      });
      return resultWidgets;
    }
    var answer = questionAnswers[questionNumber].answer;
    if (answer == isTruePressed) {
      resultWidgets.add(const Icon(Icons.check_box,color: Colors.greenAccent,));
    } else {
      resultWidgets.add(const Icon(Icons.cancel,color: Colors.redAccent,));
    }
    return resultWidgets;
  }
}
