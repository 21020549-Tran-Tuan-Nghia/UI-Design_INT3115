import 'package:flutter/material.dart';
import 'package:viet_chronicle/models/question.dart';

class QuestionItem extends StatelessWidget {
  final Question question;

  const QuestionItem({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Text(
            question.question ?? '',
          ),
        )
      ],
    );
  }
}