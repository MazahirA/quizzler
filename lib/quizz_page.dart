import 'package:flutter/material.dart';
import 'package:quizzler/quizz_store.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizManager quizManager = QuizManager();

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
                quizManager.getQuestion(),
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
                        setState(() {
                          quizManager.getAnswer(isTruePressed: false);
                          quizManager.getNextQuestion();
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
                          setState(() {
                            quizManager.getAnswer(isTruePressed: true);
                            quizManager.getNextQuestion();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: quizManager.showAnswers(),
            ),
          ),
        ],
      )),
    );
  }

}
