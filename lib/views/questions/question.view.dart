import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/question_controller.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/questions/widgets/question_item.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  final QuestionController _controller = QuestionController();

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await _controller.fetchQuestions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: Text("Question",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 32,
                      ))),
              backgroundColor: Colors.amberAccent,
            ),
            body: Center(
              child: Column(children: [
                QuestionItem(question: _controller.questions[0]),
              ]),
            ));
  }
}
