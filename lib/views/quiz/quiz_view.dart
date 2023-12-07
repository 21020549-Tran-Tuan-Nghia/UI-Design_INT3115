import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/quiz_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/quiz/widgets/answer_group.dart';
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

  int questionIndex = 0;

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
            appBar: VCAppBar(
              titleColor: ColorStyles.darkGray,
              backgroundColor: ColorStyles.snowWhite,
              backButtonColor: "gray",
              titleWidget: Container(
                width: 236 * viewportRatio,
                child: LinearProgressIndicator(
                  minHeight: 12 * viewportRatio,
                  value: (questionIndex) / quizController.questions.length,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorStyles.leafGreen,
                  ),
                  backgroundColor: ColorStyles.semiLightGray,
                  borderRadius: BorderRadius.circular(25),
              )
              )
            ),
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
                              quizController.questions[questionIndex].question,
                              style: const HeadingStyle(
                                  newColor: ColorStyles.darkGray),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // List 1x4
                        AnswerGroup(
                          quizController: quizController,
                          questionIndex: questionIndex,
                        ),
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
                            if (quizController.checkAnswer(questionIndex)) {
                              if (quizController.questions.length - 1 >
                                  questionIndex) {
                                setState(() {
                                  questionIndex++;
                                });
                              } else {
                                Navigator.popAndPushNamed(
                                    context, AppRoutes.mapView);
                              }
                            }
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
