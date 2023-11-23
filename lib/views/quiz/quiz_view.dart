import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
// import 'package:viet_chronicle/views/widgets/answer_button/vc_answer_button.dart';
import 'package:viet_chronicle/views/widgets/answer_long_button/vc_answer_long_button.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class QuizView extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();
  final VCButtonController btAnswerController = VCButtonController();

  QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.all(24 * viewportRatio),
                      child: Text(
                        "Câu hỏi?",
                        style: HeadingStyle(newColor: ColorStyles.darkGray),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  // Grid 4x4
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 8 * viewportRatio,
                  //     right: 8 * viewportRatio,
                  //   ),
                  //   child: Container(
                  //       alignment: Alignment.topCenter,
                  //       height: 510 * viewportRatio,
                  //       child: GridView.count(
                  //         crossAxisCount: 2,
                  //         childAspectRatio: (148 + 8) / 176,
                  //         children: List.generate(4, (index) {
                  //           return Center(
                  //             child: VCAnswerButton(
                  //               labelText: "Trả lời $index",
                  //               callback: () {},
                  //               controller: btAnswerController,
                  //             ),
                  //           );
                  //         }),
                  //       )),
                  // ),

                  // List 1x4
                  Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Column(
                          children: [
                            Center(
                              child: VCAnswerLongButton(
                                labelText: "Trả lời $index",
                                callback: () {},
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
                  padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                  child: VCButton.primaryGreen(
                    "Tiếp tục",
                    () {
                      // Navigator.popAndPushNamed(context, AppRoutes.mapView);
                    },
                    btResumeController,
                    locked: true,
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
