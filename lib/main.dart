import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

void main() => runApp(QuestionApp());

class _AnswerAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  void _answer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restart() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'question': 'What is your favorite color?',
      'answers': [
        {'text': 'white', 'score': 1},
        {'text': 'red', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'blue', 'score': 4},
      ]
    },
    {
      'question': 'What is your favorite animal?',
      'answers': [
        {'text': 'dog', 'score': 4},
        {'text': 'cat', 'score': 3},
        {'text': 'bird', 'score': 2},
        {'text': 'cow', 'score': 1},
      ]
    }
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hello Waldo'),
          ),
          body: hasSelectedQuestion
              ? Quiz(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  answer: _answer,
                )
              : Result(_totalScore, _restart)),
    );
  }
}

class QuestionApp extends StatefulWidget {
  _AnswerAppState createState() {
    return _AnswerAppState();
  }
}
