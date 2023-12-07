import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class QuestionResult extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();
  final VoidCallback callBack;
  QuestionResult({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360 * viewportRatio,
      height: 150 * viewportRatio,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 360 * viewportRatio,
              height: 150 * viewportRatio,
              color: const Color(0xFFB8F28B),
            ),
          ),
          const Positioned(
            left: 24 * viewportRatio,
            top: 24 * viewportRatio,
            child: SizedBox(
              width: 312 * viewportRatio,
              height: 27 * viewportRatio,
              child: Text(
                'Chính xác!',
                style: TextStyle(
                  color: Color(0xFF45A304),
                  fontSize: 24,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24 * viewportRatio,
            top: 70 * viewportRatio,
            child: VCButton.primaryGreen(
              "Tiếp tục",
              () {
                callBack();
              },
              btResumeController,
              locked: false,
            ),
          ),
        ],
      ),
    );
  }
}
