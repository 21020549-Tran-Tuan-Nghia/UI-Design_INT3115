import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/unit_button/base/vc_unit_button_base.dart';

class VCUnitButton extends StatefulWidget {
  final Color fillColor;
  final Color shadowColor;
  final String titleText;
  final Color titleColor;
  final String subText;
  final Color subColor;
  final VoidCallback callback;
  final VCButtonController controller;

  const VCUnitButton({
    super.key,
    this.fillColor = ColorStyles.leafGreen,
    this.shadowColor = ColorStyles.mossGreen,
    required this.titleText,
    this.titleColor = ColorStyles.snowWhite,
    required this.subText,
    this.subColor = ColorStyles.lightGreen,
    required this.callback,
    required this.controller,
  });

  @override
  State<VCUnitButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCUnitButton> {
  bool _tapped = false;
  bool _locked = false;

  @override
  void initState() {
    _tapped = false;
    _locked = false;
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
        handleOnTapDown(),
      },
      onTapUp: (TapUpDetails details) => {
        Future.delayed(const Duration(milliseconds: 50))
            .whenComplete(() => handleOnTapUp())
            .whenComplete(() => widget.callback.call()),
      },
      child: _locked
          ? SizedBox(
              width: 336 * viewportRatio,
              height: 88 * viewportRatio,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 8 * viewportRatio,
                    child: VCUnitButtonBase(
                      fillColor: ColorStyles.mediumGray,
                      titleText: "",
                      titleColor: widget.titleColor,
                      subText: "",
                      subColor: widget.subColor,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: VCUnitButtonBase(
                      fillColor: ColorStyles.gray,
                      titleText: widget.titleText,
                      titleColor: ColorStyles.semiDarkGray,
                      subText: widget.subText,
                      subColor: ColorStyles.lightGray,
                    ),
                  ),
                ],
              ),
            )
          : _tapped
              ? SizedBox(
                  width: 336 * viewportRatio,
                  height: 88 * viewportRatio,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8 * viewportRatio,
                        child: VCUnitButtonBase(
                          fillColor: widget.shadowColor,
                          titleText: widget.titleText,
                          titleColor: widget.titleColor,
                          subText: widget.subText,
                          subColor: widget.subColor,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: 336 * viewportRatio,
                  height: 88 * viewportRatio,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8 * viewportRatio,
                        child: VCUnitButtonBase(
                          fillColor: widget.shadowColor,
                          titleText: "",
                          titleColor: widget.titleColor,
                          subText: "",
                          subColor: widget.subColor,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: VCUnitButtonBase(
                          fillColor: widget.fillColor,
                          titleText: widget.titleText,
                          titleColor: widget.titleColor,
                          subText: widget.subText,
                          subColor: widget.subColor,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
