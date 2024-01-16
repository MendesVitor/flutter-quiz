import 'package:flutter/material.dart';
import 'package:project_questions/answer.dart';
import 'package:project_questions/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
    super.key,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['answers'] as List<Map<String, Object>>
        : [];

    return Column(children: [
      Question(questions[selectedQuestion]['question'] as String),
      ...answers.map((a) {
        return Answer(
          a['text'] as String,
          () => answer(a['score'] as int),
        );
      })
    ]);
  }
}
