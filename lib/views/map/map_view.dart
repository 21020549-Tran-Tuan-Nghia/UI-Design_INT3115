import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/circle_button/vc_circle_button.dart';
import 'package:viet_chronicle/views/widgets/unit_button/vc_unit_button.dart';

class MapView extends StatelessWidget {
  final VCButtonController controller = VCButtonController();
  final lessons = [
    'quiz',
    'quiz',
    'video',
    'reward',
    'quiz',
    'quiz',
    'video',
    'reward',
    'tropy'
  ];

  MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            ListView.builder(
              primary: false,
              padding: const EdgeInsets.only(
                  top: 162 * viewportRatio, bottom: 162 * viewportRatio),
              itemCount: lessons.length,
              itemBuilder: (context, index) => Column(
                children: [
                  VCCircleButton(
                    iconName: lessons[index],
                    callback: () {
                      if (lessons[index] == 'quiz') {
                        Navigator.popAndPushNamed(context, AppRoutes.quizView);
                      }
                      if (lessons[index] == 'video') {
                        Navigator.popAndPushNamed(
                            context, AppRoutes.videoView1);
                      }
                    },
                    controller: controller,
                    leftPadding: LessonStyles.leftPaddings[index % 9],
                    rightPadding: LessonStyles.rightPaddings[index % 9],
                  ),
                  SizedBox(
                    height: LessonStyles.bottomPaddings[index % 4],
                  )
                ],
              ),
            ),
            Container(
              height: 150 * viewportRatio,
              alignment: Alignment.topCenter,
              decoration: ShapeDecoration(
                color: ColorStyles.snowWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15 * viewportRatio),
                    child: SizedBox(height: 32 * viewportRatio),
                  ),
                  VCUnitButton(
                    titleText: "THỜI KỲ BẮC THUỘC LẦN I\n(208 TCN - 39)",
                    subText: "CHƯƠNG 1, CỬA 1",
                    callback: () {},
                    controller: controller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
