import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCSmallButtonBase extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final String labelText;
  final Color labelColor;

  const VCSmallButtonBase({
    super.key,
    required this.fillColor,
    required this.borderColor,
    this.labelText = "",
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264 * viewportRatio,
      height: 40 * viewportRatio,
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
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: SmallButtonStyle(newColor: labelColor),
        ),
      ),
    );
  }
}
