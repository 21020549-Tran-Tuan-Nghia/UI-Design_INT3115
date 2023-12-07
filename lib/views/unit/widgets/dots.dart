import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class Dots extends StatelessWidget {
  final int numberOfUnit;
  final int currentUnit;
  const Dots({
    super.key,
    required this.numberOfUnit,
    required this.currentUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60 * viewportRatio,
      height: 6 * viewportRatio,
      child: Row(
        children: List.generate(numberOfUnit, (index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 3 * viewportRatio,
              right: 3 * viewportRatio,
            ),
            child: Container(
              width: 6 * viewportRatio,
              height: 6 * viewportRatio,
              decoration: ShapeDecoration(
                color: index == currentUnit
                    ? ColorStyles.snowWhite
                    : ColorStyles.mossGreen,
                shape: const OvalBorder(),
              ),
            ),
          );
        }),
      ),
      // child: Stack(
      //   children: [
      //     Positioned(
      //       left: 0,
      //       top: 0,
      //       child: Container(
      //         width: 6 * viewportRatio,
      //         height: 6 * viewportRatio,
      //         decoration: const ShapeDecoration(
      //           color: ColorStyles.snowWhite,
      //           shape: OvalBorder(),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 12,
      //       top: 0,
      //       child: Container(
      //         width: 6,
      //         height: 6,
      //         decoration: ShapeDecoration(
      //           color: Color(0xFF45A304),
      //           shape: OvalBorder(),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 24,
      //       top: 0,
      //       child: Container(
      //         width: 6,
      //         height: 6,
      //         decoration: ShapeDecoration(
      //           color: Color(0xFF45A304),
      //           shape: OvalBorder(),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 36,
      //       top: 0,
      //       child: Container(
      //         width: 6,
      //         height: 6,
      //         decoration: ShapeDecoration(
      //           color: Color(0xFF45A304),
      //           shape: OvalBorder(),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       left: 48,
      //       top: 0,
      //       child: Container(
      //         width: 6,
      //         height: 6,
      //         decoration: ShapeDecoration(
      //           color: Color(0xFF45A304),
      //           shape: OvalBorder(),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
