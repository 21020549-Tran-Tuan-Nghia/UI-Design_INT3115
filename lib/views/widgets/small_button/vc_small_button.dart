import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/small_button/base/vc_small_button_base.dart';

class VCSmallButton extends StatefulWidget {
  final String labelText;
  final Color textColor;
  final Color shadowTextColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback callback;

  const VCSmallButton({
    super.key,
    required this.labelText,
    required this.textColor,
    required this.shadowTextColor,
    required this.shadowColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.callback,
  });

  // Primary Green Small Button
  factory VCSmallButton.primaryGreen(String labelText, VoidCallback callback) {
    return VCSmallButton(
      labelText: labelText,
      textColor: ColorStyles.snowWhite,
      shadowTextColor: ColorStyles.snowWhite,
      shadowColor: ColorStyles.mossGreen,
      backgroundColor: ColorStyles.leafGreen,
      borderColor: ColorStyles.leafGreen,
      callback: callback,
    );
  }

  // Primary Pink Small Button
  factory VCSmallButton.primaryPink(String labelText, VoidCallback callback) {
    return VCSmallButton(
      labelText: labelText,
      textColor: ColorStyles.snowWhite,
      shadowTextColor: ColorStyles.snowWhite,
      shadowColor: ColorStyles.darkPink,
      backgroundColor: ColorStyles.lotusPink,
      borderColor: ColorStyles.lotusPink,
      callback: callback,
    );
  }

  // Secondary Pink Small Button
  factory VCSmallButton.secondaryPink(String labelText, VoidCallback callback) {
    return VCSmallButton(
      labelText: labelText,
      textColor: ColorStyles.darkPink,
      shadowTextColor: ColorStyles.snowWhite,
      shadowColor: ColorStyles.darkPink,
      backgroundColor: ColorStyles.snowWhite,
      borderColor: ColorStyles.darkPink,
      callback: callback,
    );
  }

  @override
  State<VCSmallButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCSmallButton> {
  bool _tapped = false;

  @override
  void initState() {
    _tapped = false;
    super.initState();
  }

  void handleOnTapDown() {
    setState(() {
      _tapped = true;
    });
  }

  void handleOnTapUp() {
    setState(() {
      _tapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) => {
              handleOnTapDown(),
            },
        onTapUp: (TapUpDetails details) => {
              Future.delayed(const Duration(milliseconds: 50))
                  .whenComplete(() => handleOnTapUp())
                  .whenComplete(() => widget.callback.call()),
            },
        child: _tapped
            ? SizedBox(
                width: 264 * viewportRatio,
                height: 48 * viewportRatio,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8 * viewportRatio,
                      child: VCSmallButtonBase(
                        fillColor: widget.shadowColor,
                        borderColor: widget.shadowColor,
                        labelColor: widget.shadowTextColor,
                        labelText: widget.labelText,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: 264 * viewportRatio,
                height: 48 * viewportRatio,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8 * viewportRatio,
                      child: VCSmallButtonBase(
                        fillColor: widget.shadowColor,
                        borderColor: widget.shadowColor,
                        labelColor: widget.shadowColor,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: VCSmallButtonBase(
                        fillColor: widget.backgroundColor,
                        borderColor: widget.borderColor,
                        labelColor: widget.textColor,
                        labelText: widget.labelText,
                      ),
                    ),
                  ],
                ),
              ));
  }
}
