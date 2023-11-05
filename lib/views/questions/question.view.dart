import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/question_controller.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/questions/widgets/question_item.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';
import 'package:viet_chronicle/routes/routes.dart';

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
        ? const LoadingView()
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
                VCButton(
                    labelText: "Vợ chồng",
                    callback: () => {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.splashView)
                        }),
                VCButton(
                    labelText: "Anh em",
                    callback: () => {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.splashView)
                        }),
                VCButton(
                    labelText: "Hàng xóm",
                    callback: () => {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.splashView)
                        }),
                VCButton(
                    labelText: "Là một",
                    callback: () => {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.splashView)
                        })
              ]),
            ));
  }
}
