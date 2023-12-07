import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/quiz_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
// import 'package:viet_chronicle/views/widgets/answer_button/vc_answer_button.dart';
import 'package:viet_chronicle/views/widgets/answer_long_button/vc_answer_long_button.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  // Quiz Controller
  final QuizController quizController = QuizController();

  // Button Controller
  final VCButtonController btResumeController = VCButtonController();
  final VCButtonController btAnswerController = VCButtonController();

  // Answer State
  bool _answerState = false;
  bool _fetchState = false;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await quizController.fetchQuestions();
      setState(() {
        _fetchState = true;
      });
    });
    _answerState = false;
    super.initState();
  }

  void setAnswerState(bool value) {
    setState(() {
      _answerState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_fetchState
        ? const LoadingView()
        : Scaffold(
            appBar: VCAppBar.lessionAppBar(),
            body: Center(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(24 * viewportRatio),
                            child: Text(
                              quizController.questions[0].question,
                              style: const HeadingStyle(
                                  newColor: ColorStyles.darkGray),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // List 1x4
                        Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                quizController.questions[0].answers.length,
                                (index) {
                              return Column(
                                children: [
                                  Center(
                                    child: VCAnswerLongButton(
                                      labelText: quizController
                                          .questions[0].answers.keys
                                          .toList()[index],
                                      callback: () {
                                        setAnswerState(!_answerState);
                                        // btAnswerController.setLock!(_answerState);
                                      },
                                      controller: btAnswerController,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20 * viewportRatio),
                        child: VCButton.primaryGreen(
                          "Tiếp tục",
                          () {
                            Navigator.popAndPushNamed(
                                context, AppRoutes.mapView);
                          },
                          btResumeController,
                          locked: _answerState,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
