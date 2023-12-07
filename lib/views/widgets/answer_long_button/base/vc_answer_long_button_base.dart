import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCAnswerLongButtonBase extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final String labelText;
  final Color labelColor;
  final double scale;

  const VCAnswerLongButtonBase({
    super.key,
    required this.fillColor,
    required this.borderColor,
    required this.labelText,
    required this.labelColor,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312 * viewportRatio,
      height: 40 * viewportRatio * scale,
      decoration: ShapeDecoration(
        color: fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
          side: BorderSide(
            width: ShapeStyles.strokeWidth,
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0 * viewportRatio),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            labelText,
            textAlign: TextAlign.center,
            style: SubHeadingStyle(newColor: labelColor),
          ),
        ),
      ),
    );
  }
}
