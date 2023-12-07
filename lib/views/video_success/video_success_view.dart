import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/views/quiz_result/widgets/exp.dart';
import 'package:viet_chronicle/views/video_success/widgets/dur.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

// ignore: must_be_immutable
class VideoSuccessView extends StatelessWidget {
  // Button Controller
  final VCButtonController btResumeController = VCButtonController();

  late Duration videoDuration;

  VideoSuccessView({
    super.key,
    required this.videoDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  'assets/images/result_full.png',
                  height: 260 * viewportRatio,
                ),
              ),
              const SizedBox(
                height: 30 * viewportRatio,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
                child: Text(
                  "Hoàn thành Video!",
                  textAlign: TextAlign.center,
                  style: HeadingStyle(newColor: ColorStyles.darkPink),
                ),
              ),
              const SizedBox(
                height: 12 * viewportRatio,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
                child: Text(
                  "Bạn vừa xem xong một video cực kỳ bổ ích!",
                  textAlign: TextAlign.center,
                  style: SubHeadingStyle(newColor: ColorStyles.lotusPink),
                ),
              ),
              const SizedBox(
                height: 39 * viewportRatio,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Exp(
                    exp: 50,
                  ),
                  const SizedBox(
                    width: 24 * viewportRatio,
                    height: 24 * viewportRatio,
                  ),
                  Dur(
                    dur: videoDuration,
                  ),
                ],
              ),
              const SizedBox(
                height: 101 * viewportRatio,
              ),
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
                    GlobalData.instance.updateEXP(50);

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
