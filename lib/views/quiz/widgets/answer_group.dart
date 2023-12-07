import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/quiz_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/quiz/widgets/answer_button.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';

class AnswerGroup extends StatefulWidget {
  final QuizController quizController;
  final int questionIndex;
  final bool checkAnswer;
  final VCButtonController btResumeController;

  const AnswerGroup({
    super.key,
    required this.quizController,
    required this.questionIndex,
    required this.checkAnswer,
    required this.btResumeController,
  });

  @override
  State<AnswerGroup> createState() => _AnswerGroupState();
}

class _AnswerGroupState extends State<AnswerGroup> {
  final VCButtonController btAnswerController = VCButtonController();

  bool checkCorrect(index) {
    String answer = widget
        .quizController.questions[widget.questionIndex].answers.keys
        .toList()[index];
    Map<String, bool> answerState =
        widget.quizController.questions[widget.questionIndex].answers;
    return widget.checkAnswer && answerState[answer]!;
  }

  bool checkWrong(index) {
    String answer = widget
        .quizController.questions[widget.questionIndex].answers.keys
        .toList()[index];
    Map<String, bool> answerState =
        widget.quizController.questions[widget.questionIndex].answers;
    return widget.checkAnswer &&
        !answerState[answer]! &&
        widget.quizController.questions[widget.questionIndex].choosenAnswer ==
            answer;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            widget.quizController.questions[widget.questionIndex].answers
                .length, (index) {
          return Column(
            children: [
              Center(
                child: AnswerButton(
                  labelText: widget.quizController
                      .questions[widget.questionIndex].answers.keys
                      .toList()[index],
                  callback: () {
                    if (!widget.btResumeController.isActive) {
                      setState(() {
                        widget.quizController.questions[widget.questionIndex]
                                .choosenAnswer =
                            widget.quizController
                                .questions[widget.questionIndex].answers.keys
                                .toList()[index];
                      });
                    }
                    // btAnswerController.setLock!(_answerState);
                    widget.btResumeController.setLock!(false);
                  },
                  controller: btAnswerController,
                  selected: widget.quizController
                          .questions[widget.questionIndex].choosenAnswer ==
                      widget.quizController.questions[widget.questionIndex]
                          .answers.keys
                          .toList()[index],
                  correct: checkCorrect(index),
                  wrong: checkWrong(index),
                  scale: widget.quizController.questions[widget.questionIndex]
                              .answers.keys
                              .toList()[index]
                              .length >
                          VCThreshold.longText
                      ? 2.0
                      : 1.0,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          );
        }),
      ),
    );
  }
}
