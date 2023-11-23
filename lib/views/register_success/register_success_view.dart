import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class RegisterSuccessView extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();

  RegisterSuccessView({super.key});

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
                  'assets/images/app_logo.png',
                  height: 198 * viewportRatio,
                ),
              ),

              const SizedBox(
                height: 24 * viewportRatio,
              ),

              // Title
              const Text(
                'Đăng ký thành công!',
                textAlign: TextAlign.center,
                style: HeadingStyle(newColor: ColorStyles.darkPink),
              ),

              const SizedBox(
                height: 12 * viewportRatio,
              ),

              // Sub Title
              const Text(
                'Chào mừng bạn tới Viet Chronicles,\nchúc bạn có những bài học thú vị và bổ ích.',
                textAlign: TextAlign.center,
                style: SubHeadingStyle(newColor: ColorStyles.lotusPink),
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
