import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/base/vc_button_base.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';

class VCButton extends StatefulWidget {
  final String labelText;
  final Color textColor;
  final Color shadowTextColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback callback;
  final VCButtonController controller;
  final bool locked;
  // TODO: notify Lock
  // final ValueChanged<bool> notifyLock;

  const VCButton({
    super.key,
    required this.labelText,
    required this.textColor,
    required this.shadowTextColor,
    required this.shadowColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.callback,
    required this.controller,
    this.locked = false,
    // required this.notifyLock
  });

  // Primary Green Button
  factory VCButton.primaryGreen(
      String labelText, VoidCallback callback, VCButtonController controller,
      {bool locked = false}) {
    return VCButton(
      labelText: labelText,
      textColor: ColorStyles.snowWhite,
      shadowTextColor: ColorStyles.snowWhite,
      shadowColor: ColorStyles.mossGreen,
      backgroundColor: ColorStyles.leafGreen,
      borderColor: ColorStyles.leafGreen,
      callback: callback,
      controller: controller,
      locked: locked,
    );
  }

  // Primary Pink Button
  factory VCButton.primaryPink(
      String labelText, VoidCallback callback, VCButtonController controller,
      {bool locked = false}) {
    return VCButton(
      labelText: labelText,
      textColor: ColorStyles.snowWhite,
      shadowTextColor: ColorStyles.snowWhite,
      shadowColor: ColorStyles.darkPink,
      backgroundColor: ColorStyles.lotusPink,
      borderColor: ColorStyles.lotusPink,
      callback: callback,
      controller: controller,
      locked: locked,
    );
  }

  @override
  State<VCButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCButton> {
  bool _tapped = false;
  bool _locked = false;

  @override
  void initState() {
    _tapped = false;
    _locked = widget.locked;
    widget.controller.setLock = setLock;
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

  void setLock(bool lockValue) {
    setState(() {
      _locked = lockValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) => {
        if (!_locked)
          {
            handleOnTapDown(),
          }
      },
      onTapUp: (TapUpDetails details) => {
        if (!_locked)
          {
            Future.delayed(const Duration(milliseconds: 50))
                .whenComplete(() => handleOnTapUp())
                .whenComplete(() => widget.callback.call()),
          }
      },
      child: _locked
          ? SizedBox(
              width: 312 * viewportRatio,
              height: 60 * viewportRatio,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 8 * viewportRatio,
                    child: VCButtonBase(
                      fillColor: ColorStyles.mediumGray,
                      borderColor: ColorStyles.mediumGray,
                      labelColor: ColorStyles.snowWhite,
                      labelText: widget.labelText,
                    ),
                  ),
                ],
              ),
            )
          : _tapped
              ? SizedBox(
                  width: 312 * viewportRatio,
                  height: 60 * viewportRatio,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8 * viewportRatio,
                        child: VCButtonBase(
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
                  width: 312 * viewportRatio,
                  height: 60 * viewportRatio,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8 * viewportRatio,
                        child: VCButtonBase(
                          fillColor: widget.shadowColor,
                          borderColor: widget.shadowColor,
                          labelColor: widget.shadowColor,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: VCButtonBase(
                          fillColor: widget.backgroundColor,
                          borderColor: widget.borderColor,
                          labelColor: widget.textColor,
                          labelText: widget.labelText,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
