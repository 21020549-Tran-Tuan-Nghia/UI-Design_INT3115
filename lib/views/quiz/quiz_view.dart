import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/quiz_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/quiz/widgets/answer_group.dart';
import 'package:viet_chronicle/views/quiz/widgets/question_result.dart';
import 'package:viet_chronicle/views/quiz_result/quiz_result_view.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/progress_bar_controller/vc_progress_bar_controller.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/vc_progress_bar.dart';

// ignore: must_be_immutable
class QuizView extends StatefulWidget {
  int lessonId;

  QuizView({super.key, required this.lessonId});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> with TickerProviderStateMixin {
  // Quiz Controller
  final QuizController quizController = QuizController();

  // Button Controller
  final VCButtonController btResumeController = VCButtonController();
  final VCButtonController btAnswerController = VCButtonController();

  // Progress Bar Controller
  final VCProgressBarController vcProgressBarController =
      VCProgressBarController();

  // Answer State
  // bool _answerState = false;
  bool _fetchState = false;
  bool _checkAnswer = false;
  int questionIndex = 0;

  int count = 0;

  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _isBoxVisible = false;

  bool _isLock = true;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await quizController.fetchQuestions(widget.lessonId);
      setState(() {
        _fetchState = true;
      });
    });

    vcProgressBarController.totalDuration = quizController.questions.length;

    // _answerState = false;
    _checkAnswer = false;
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    btResumeController.setLock = setLock;
  }

  void _toggleBoxVisibility() {
    setState(() {
      _isBoxVisible = !_isBoxVisible;
      if (_isBoxVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void setAnswerState(bool value) {
    setState(() {
      // _answerState = value;
    });
  }

  void setLock(bool newLock) {
    setState(() {
      _isLock = newLock;
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
              titleWidget: VCProgressBar(
                vcProgressBarController: vcProgressBarController,
                valueColor: ColorStyles.leafGreen,
                backgroundColor: ColorStyles.semiLightGray,
              ),
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
                          checkAnswer: _checkAnswer,
                          btResumeController: btResumeController,
                        ),
                      ],
                    ),
                  ),
                  if (!_isBoxVisible)
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20 * viewportRatio),
                          child: VCButton.primaryGreen(
                            "Tiếp tục",
                            () {
                              btResumeController.isActive = true;
                              vcProgressBarController.currentDuration++;
                              vcProgressBarController.totalDuration =
                                  quizController.questions.length;
                              _checkAnswer = true;
                              _toggleBoxVisibility();
                            },
                            btResumeController,
                            locked: _isLock,
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SlideTransition(
                      position: _animation,
                      child: _isBoxVisible
                          ? QuestionResult(
                              type: quizController.checkAnswer(questionIndex)
                                  ? "correct"
                                  : "wrong",
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  if (_isBoxVisible)
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20 * viewportRatio),
                          child: VCButton(
                            labelText: "Tiếp tục",
                            textColor: ColorStyles.snowWhite,
                            shadowTextColor: ColorStyles.snowWhite,
                            shadowColor:
                                quizController.checkAnswer(questionIndex)
                                    ? ColorStyles.mossGreen
                                    : ColorStyles.darkRed,
                            backgroundColor:
                                quizController.checkAnswer(questionIndex)
                                    ? ColorStyles.leafGreen
                                    : ColorStyles.wrongRed,
                            borderColor:
                                quizController.checkAnswer(questionIndex)
                                    ? ColorStyles.leafGreen
                                    : ColorStyles.wrongRed,
                            callback: () {
                              if (quizController.checkAnswer(questionIndex)) {
                                count += 1;
                              }
                              _toggleBoxVisibility();
                              if (quizController.questions.length - 1 >
                                  questionIndex) {
                                setState(() {
                                  questionIndex++;
                                });
                                btResumeController.setLock!(true);
                                btResumeController.isActive = false;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizResultView(
                                            lessonId: widget.lessonId,
                                            count: count,
                                            total:
                                                quizController.questions.length,
                                          )),
                                );
                              }
                              _checkAnswer = false;
                            },
                            controller: btResumeController,
                            locked: false,
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
