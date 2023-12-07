import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class RewardView extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();

  RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  'assets/images/reward_view.png',
                  height: 312 * viewportRatio,
                ),
              ),

              const SizedBox(
                height: 24 * viewportRatio,
              ),

              // Title
              const Text(
                'Bạn nhận được 50KN',
                textAlign: TextAlign.center,
                style: HeadingStyle(newColor: ColorStyles.darkPink),
              ),

              const SizedBox(
                height: 12 * viewportRatio,
              ),

              // Sub Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0 * viewportRatio),
                child: Text(
                  'Hoàn thành Các bài học tiếp theo để nhận thêm các rương phần thưởng!',
                  textAlign: TextAlign.center,
                  style: SubHeadingStyle(newColor: ColorStyles.lotusPink),
                ),
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
                    GlobalData.instance.updateEXP(50);
                    GlobalData.instance.updateLesson();
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
