import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCCircleButtonBase extends StatelessWidget {
  final Color fillColor;
  final String iconName;

  const VCCircleButtonBase({
    super.key,
    required this.fillColor,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62 * viewportRatio,
      height: 56 * viewportRatio,
      decoration: ShapeDecoration(
        color: fillColor,
        shape: const OvalBorder(),
      ),
      child: iconName != ""
          ? Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/$iconName.png",
                width: 48 * viewportRatio,
                height: 48 * viewportRatio,
              ),
            )
          : const SizedBox(),
      // child: Align(
      //   alignment: AlignmentDirectional.center,
      //   child: Text(
      //     labelText,
      //     textAlign: TextAlign.center,
      //     style: HeadingStyle(newColor: labelColor),
      //   ),
      // ),
    );
  }
}
