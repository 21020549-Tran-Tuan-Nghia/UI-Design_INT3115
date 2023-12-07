import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class BreakSubunit extends StatelessWidget {
  final String subUnitTitle;
  const BreakSubunit({
    super.key,
    required this.subUnitTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0 * viewportRatio),
      child: Container(
        height: 32 * viewportRatio,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 336 * viewportRatio,
              height: 2 * viewportRatio,
              decoration: BoxDecoration(color: ColorStyles.semiDarkGray),
            ),
            Text(
              subUnitTitle,
              style:
                  SubHeadingStyle(newColor: ColorStyles.semiDarkGray).copyWith(
                      background: Paint()
                        ..color = ColorStyles.snowWhite
                        ..strokeWidth = 24.0 * viewportRatio
                        ..style = PaintingStyle.stroke),
            ),
          ],
        ),
      ),
    );
  }
}
