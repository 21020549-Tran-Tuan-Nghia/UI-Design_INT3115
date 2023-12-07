import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/progress_bar_controller/vc_progress_bar_controller.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/vc_progress_bar.dart';

class VideoSummary extends StatefulWidget {
  late Duration videoDuration;

  VideoSummary({
    super.key,
    required this.videoDuration,
  });

  @override
  State<VideoSummary> createState() => _VideoSummaryState();
}

class _VideoSummaryState extends State<VideoSummary> {
  // Button Controller
  final VCButtonController btResumeController = VCButtonController();

  // Progress Bar Controller
  final VCProgressBarController vcProgressBarController =
      VCProgressBarController();

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    vcProgressBarController.currentDuration = 1;
    vcProgressBarController.totalDuration = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VCAppBar(
        titleColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        backButtonColor: "gray",
        titleWidget: VCProgressBar(
            vcProgressBarController: vcProgressBarController,
            valueColor: ColorStyles.leafGreen,
            backgroundColor: ColorStyles.semiLightGray),
      ),
      body: Stack(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 24.0 * viewportRatio,
                    right: 24.0 * viewportRatio,
                    top: 24.0 * viewportRatio),
                child: Text(
                  'Tóm tắt',
                  style: HeadingStyle(newColor: ColorStyles.darkGray),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 24.0 * viewportRatio,
                    right: 24.0 * viewportRatio,
                    top: 24.0 * viewportRatio),
                child: Text(
                  'This is a brief description of the video. It can contain important information about the content.',
                  style: SubHeadingStyle(newColor: ColorStyles.darkGray),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
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
                        color: const Color(0xFFB8F28B)),
                  ),
                  const Positioned(
                    left: 24 * viewportRatio,
                    top: 24 * viewportRatio,
                    child: SizedBox(
                      width: 312 * viewportRatio,
                      height: 27 * viewportRatio,
                      child: Text(
                        'Hoàn thành Video',
                        style: HeadingStyle(newColor: ColorStyles.mossGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                child: VCButton.primaryGreen(
                  "Tiếp tục",
                  () {},
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
