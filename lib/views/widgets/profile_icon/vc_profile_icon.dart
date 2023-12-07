import "package:flutter/material.dart";
import 'package:viet_chronicle/utils/styles.dart';

class VCProfileIcon extends StatelessWidget {
  const VCProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32 * viewportRatio,
      height: 32 * viewportRatio,
      decoration: const ShapeDecoration(
          color: ColorStyles.semiLightGray, shape: OvalBorder()),
      child: Column(children: [
        const SizedBox(
          height: 6 * viewportRatio,
        ),
        Container(
          width: 12 * viewportRatio,
          height: 12 * viewportRatio,
          decoration: const ShapeDecoration(
            color: ColorStyles.mediumGray,
            shape: OvalBorder(),
          ),
        ),
        const SizedBox(
          height: 2 * viewportRatio,
        ),
        Container(
          width: 24 * viewportRatio,
          height: 12 * viewportRatio,
          decoration: const ShapeDecoration(
            color: ColorStyles.mediumGray,
            shape: OvalBorder(),
          ),
        ),
      ]),
    );
  }
}
