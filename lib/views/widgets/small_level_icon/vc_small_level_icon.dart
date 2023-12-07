import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VcSmallLevelIcon extends StatelessWidget {
  final int level;

  const VcSmallLevelIcon({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32 * viewportRatio,
      height: 32 * viewportRatio,
      decoration: ShapeDecoration(
        color: ColorStyles.lotusPink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8 * viewportRatio),
        ),
      ),
      child: Center(
        child: Text(
          "$level",
          style: const HeadingStyle(newColor: ColorStyles.snowWhite)
              .copyWith(fontSize: 16 * viewportRatio),
        ),
      ),
    );
  }
}
