import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restart;

  const Result(this.score, this.restart, {super.key});

  String get resultText {
    if (score <= 2) {
      return 'Congratz!';
    } else if (score < 5) {
      return 'U Rock!';
    } else if (score <= 6) {
      return 'Awesome';
    } else {
      return 'Jedi Mater';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultText,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: restart,
          child: const Text('Restart?'),
        )
      ],
    );
  }
}
