import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCUnitButtonBase extends StatelessWidget {
  final Color fillColor;
  final String titleText;
  final Color titleColor;
  final String subText;
  final Color subColor;

  const VCUnitButtonBase({
    super.key,
    required this.fillColor,
    required this.titleText,
    required this.titleColor,
    required this.subText,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336 * viewportRatio,
      height: 80 * viewportRatio,
      decoration: ShapeDecoration(
        color: fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.all(12 * viewportRatio),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 16 * viewportRatio,
                child: Text(
                  titleText,
                  textAlign: TextAlign.left,
                  style: UnitTitleStyle(newColor: titleColor),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Text(
                  subText,
                  textAlign: TextAlign.left,
                  style: UnitSubTitleStyle(newColor: subColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
