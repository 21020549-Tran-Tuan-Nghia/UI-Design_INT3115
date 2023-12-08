import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class StreakView extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();

  StreakView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0 * viewportRatio),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Image.asset(
                        'assets/images/streak_view.png',
                        height: 312 * viewportRatio,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 142 * viewportRatio),
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Text(
                              (GlobalData.instance.user.streak + 1).toString(),
                              style:
                                  HeadingStyle(newColor: ColorStyles.snowWhite)
                                      .copyWith(
                                fontSize: 56 * viewportRatio,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 8 * viewportRatio
                                  ..color = ColorStyles.snowWhite,
                              ),
                            ),
                            Text(
                              (GlobalData.instance.user.streak + 1).toString(),
                              style:
                                  HeadingStyle(newColor: ColorStyles.darkPink)
                                      .copyWith(fontSize: 56 * viewportRatio),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 232 * viewportRatio),
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Text(
                              "ngày streak!",
                              style:
                                  HeadingStyle(newColor: ColorStyles.snowWhite)
                                      .copyWith(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 8 * viewportRatio
                                  ..color = ColorStyles.snowWhite,
                              ),
                            ),
                            Text(
                              "ngày streak!",
                              style:
                                  HeadingStyle(newColor: ColorStyles.mossGreen),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 24 * viewportRatio,
                ),

                SizedBox(
                  width: 312 * viewportRatio,
                  height: 138 * viewportRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 312 * viewportRatio,
                        height: 138 * viewportRatio,
                        decoration: BoxDecoration(
                          color: ColorStyles.snowWhite,
                          border: Border.all(
                            color: ColorStyles.darkPink,
                            width: 2 * viewportRatio,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                          borderRadius:
                              BorderRadius.circular(ShapeStyles.cornerRadius),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10.0 * viewportRatio),
                        child: Container(
                          width: 312 * viewportRatio,
                          height: 2 * viewportRatio,
                          decoration: BoxDecoration(
                            color: ColorStyles.darkPink,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 72.0 * viewportRatio,
                            left: 12.0 * viewportRatio,
                            right: 12.0 * viewportRatio),
                        child: Text(
                          "Đỉnh của chóp! Hãy tiếp tục luyện tập để streak được tăng thêm!",
                          style:
                              SubHeadingStyle(newColor: ColorStyles.darkPink),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 28.5 * viewportRatio,
                            left: 28.5 * viewportRatio,
                            bottom: 50 * viewportRatio),
                        child: Row(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.all(9.5 * viewportRatio),
                              child: Column(
                                children: [
                                  Text(
                                    "T${index + 2}",
                                    style: SmallButtonStyle(
                                        newColor: ColorStyles.darkPink),
                                  ),
                                  Image.asset(
                                    "assets/images/streak_on.png",
                                    height: 32 * viewportRatio,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                child: VCButton.primaryPink(
                  "Tiếp tục",
                  () {
                    GlobalData.instance.updateStreak();
                    GlobalData.instance.isStreak = true;
                    Navigator.popAndPushNamed(context, AppRoutes.mapView);
                  },
                  btResumeController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
