import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/unit/widgets/dots.dart';
import 'package:viet_chronicle/views/unit/widgets/progress_bar.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/small_button/vc_small_button.dart';

class UnitView extends StatefulWidget {
  UnitView({super.key});

  @override
  State<UnitView> createState() => _UnitViewState();
}

class _UnitViewState extends State<UnitView> {
  final VCButtonController btResumeController = VCButtonController();

  // int _unit_state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: ColorStyles.leafGreen,
      //   title: const Text(
      //     'Lịch sử Văn hoá',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 24,
      //       fontFamily: 'Nunito',
      //       fontWeight: FontWeight.w800,
      //       height: 0,
      //     ),
      //   ),
      //   shadowColor: Colors.transparent,
      // ),
      appBar: VCAppBar.unitAppBar(
        "Lịch sử Văn hoá",
      ),
      backgroundColor: ColorStyles.leafGreen,
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 12 * viewportRatio,
            decoration: BoxDecoration(color: Color(0xFF45A304)),
          ),
          const SizedBox(
            height: 40 * viewportRatio,
          ),
          Container(
            width: 256 * viewportRatio,
            height: 256 * viewportRatio,
            decoration: ShapeDecoration(
              color: Color(0xFF45A304),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            height: 41,
          ),
          Container(
            width: 288 * viewportRatio,
            height: 237 * viewportRatio,
            decoration: ShapeDecoration(
              color: Color(0xFF45A304),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                'Chương 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16 * viewportRatio,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 240 * viewportRatio,
                height: 62 * viewportRatio,
                child: Text(
                  'Thời kỳ dựng nước và giữ nước',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ProgressBar(),
              const SizedBox(
                height: 25,
              ),
              VCSmallButton(
                labelText: "TIẾP TỤC",
                textColor: ColorStyles.mossGreen,
                shadowColor: ColorStyles.semiLightGray,
                shadowTextColor: ColorStyles.semiLightGray,
                backgroundColor: ColorStyles.snowWhite,
                borderColor: ColorStyles.snowWhite,
                callback: () => {},
              ),
            ]),
          ),
          const SizedBox(
            height: 28,
          ),
          Dots()
        ],
      )),
    );
  }
}
