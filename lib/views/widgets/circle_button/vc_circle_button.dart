import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/circle_button/base/vc_circle_button_base.dart';

class VCCircleButton extends StatefulWidget {
  final String iconName;
  final Color shadowColor;
  final Color backgroundColor;
  final VoidCallback callback;
  final VCButtonController controller;
  final double leftPadding;
  final double rightPadding;

  const VCCircleButton({
    super.key,
    this.iconName = "",
    this.shadowColor = ColorStyles.mossGreen,
    this.backgroundColor = ColorStyles.leafGreen,
    required this.callback,
    required this.controller,
    required this.leftPadding,
    required this.rightPadding,
  });

  @override
  State<VCCircleButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCCircleButton> {
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
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.leftPadding, right: widget.rightPadding),
        child: SizedBox(
          width: 360 * viewportRatio,
          height: 64 * viewportRatio,
          child: Center(
            child: _locked
                ? SizedBox(
                    width: 62 * viewportRatio,
                    height: 64 * viewportRatio,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          top: 8 * viewportRatio,
                          child: VCCircleButtonBase(
                            fillColor: ColorStyles.mediumGray,
                            iconName: "",
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0 * viewportRatio,
                          child: VCCircleButtonBase(
                            fillColor: ColorStyles.gray,
                            iconName: "${widget.iconName}_icon_gray",
                          ),
                        ),
                      ],
                    ),
                  )
                : _tapped
                    ? SizedBox(
                        width: 62 * viewportRatio,
                        height: 64 * viewportRatio,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 8 * viewportRatio,
                              child: VCCircleButtonBase(
                                fillColor: widget.shadowColor,
                                iconName: "${widget.iconName}_icon_white",
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: 62 * viewportRatio,
                        height: 64 * viewportRatio,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 8 * viewportRatio,
                              child: VCCircleButtonBase(
                                fillColor: widget.shadowColor,
                                iconName: "",
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: VCCircleButtonBase(
                                fillColor: widget.backgroundColor,
                                iconName: "${widget.iconName}_icon_white",
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
