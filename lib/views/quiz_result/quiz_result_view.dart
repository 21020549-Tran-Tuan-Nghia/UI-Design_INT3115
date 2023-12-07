import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/progress_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/quiz_result/widgets/acc.dart';
import 'package:viet_chronicle/views/quiz_result/widgets/exp.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

// ignore: must_be_immutable
class QuizResultView extends StatelessWidget {
  late int total;
  late int count;
  late int lessonId;
  ProgressController progressController = ProgressController();

  QuizResultView(
      {super.key,
      required this.count,
      required this.total,
      required this.lessonId});

  VCButtonController btResumeController = VCButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  (count == total)
                      ? 'assets/images/result_full.png'
                      : (count / total >= 0.75)
                          ? 'assets/images/result_three_quarter.png'
                          : (count / total >= 0.5)
                              ? 'assets/images/result_half.png'
                              : 'assets/images/result_quarter.png',
                  height: 260 * viewportRatio,
                ),
              ),
              const SizedBox(
                height: 30 * viewportRatio,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
                child: Text(
                  (count == total)
                      ? "Bài học xuất sắc"
                      : (count / total >= 0.75)
                          ? "Bài học tuyệt vời"
                          : (count / total >= 0.5)
                              ? "Bài học tốt"
                              : "Bài học khá",
                  textAlign: TextAlign.center,
                  style: const HeadingStyle(newColor: ColorStyles.darkPink),
                ),
              ),
              const SizedBox(
                height: 12 * viewportRatio,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
                child: Text(
                  (count == total)
                      ? "Bạn không mắc một lỗi sai nào trong bài học này."
                      : (count / total >= 0.75)
                          ? "Bạn mắc lỗi ở một vài câu khó, hãy cố gắng ở các bài học sau."
                          : (count / total >= 0.5)
                              ? "Bạn đang làm rất tốt, hãy thử chinh phục những câu khó trong các lần học sau."
                              : "Vạn sự khởi đầu nan, hãy cố gắng ở các bài sau.",
                  textAlign: TextAlign.center,
                  style: const SubHeadingStyle(newColor: ColorStyles.lotusPink),
                ),
              ),
              const SizedBox(
                height: 39 * viewportRatio,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Exp(exp: (count / total * 20).round()),
                  const SizedBox(
                    width: 24 * viewportRatio,
                    height: 24 * viewportRatio,
                  ),
                  Acc(acc: (count / total * 100).round()),
                ],
              ),
              const SizedBox(
                height: 101 * viewportRatio,
              ),
              // Register Button
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                child: VCButton.primaryPink(
                  "Tiếp tục",
                  () {
                    // Update EXP
                    GlobalData.instance.updateEXP((count / total * 20).round());

                    GlobalData.instance.updateLesson();

                    Navigator.popAndPushNamed(context, AppRoutes.mapView);
                  },
                  btResumeController,
                  locked: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
