import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/unit_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/unit/widgets/dots.dart';
import 'package:viet_chronicle/views/unit/widgets/progress_bar.dart';
import 'package:viet_chronicle/views/widgets/small_button/vc_small_button.dart';

class SingleUnitPage extends StatelessWidget {
  final UnitController unitController;
  final int unitId;

  const SingleUnitPage({
    super.key,
    required this.unitController,
    required this.unitId,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 12 * viewportRatio,
            decoration: const BoxDecoration(color: ColorStyles.mossGreen),
          ),
          Column(
            children: [
              const SizedBox(
                height: 40 * viewportRatio,
              ),
              Container(
                width: 256 * viewportRatio,
                height: 256 * viewportRatio,
                decoration: ShapeDecoration(
                  color: ColorStyles.mossGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ShapeStyles.cornerRadius),
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
                  color: ColorStyles.mossGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ShapeStyles.cornerRadius),
                  ),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Chương ${unitId + 1}',
                    textAlign: TextAlign.center,
                    style:
                        const SmallButtonStyle(newColor: ColorStyles.snowWhite),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 240 * viewportRatio,
                    height: 62 * viewportRatio,
                    child: Text(
                      unitController.getUnit(unitId).title ?? '',
                      textAlign: TextAlign.center,
                      style:
                          const HeadingStyle(newColor: ColorStyles.snowWhite),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ProgressBar(
                    length: unitController.getUnit(unitId).subunits.length,
                    current: 1, //TODO: current progress
                  ),
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
            ],
          ),
        ],
      ),
    );
  }
}