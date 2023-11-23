import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCLoginBreak extends StatelessWidget {
  const VCLoginBreak({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264 * viewportRatio,
      height: 20 * viewportRatio,
      child: Stack(
        children: [
          Positioned(
            left: 98 * viewportRatio,
            top: 0,
            child: SizedBox(
              width: 68 * viewportRatio,
              height: 20 * viewportRatio,
              child: Center(
                child: Text(
                  'HOẶC',
                  textAlign: TextAlign.center,
                  style: const SmallButtonStyle(
                    newColor: ColorStyles.mediumGray,
                  ).copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 9 * viewportRatio,
            child: Container(
              width: 97 * viewportRatio,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: ShapeStyles.strokeWidth / 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: ColorStyles.mediumGray,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 167 * viewportRatio,
            top: 9 * viewportRatio,
            child: Container(
              width: 97 * viewportRatio,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: ShapeStyles.strokeWidth / 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: ColorStyles.mediumGray,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
