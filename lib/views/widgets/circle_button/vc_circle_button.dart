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
  final String status;

  const VCCircleButton({
    super.key,
    this.iconName = "",
    this.shadowColor = ColorStyles.mossGreen,
    this.backgroundColor = ColorStyles.leafGreen,
    required this.callback,
    required this.controller,
    required this.leftPadding,
    required this.rightPadding,
    required this.status,
  });

  @override
  State<VCCircleButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCCircleButton> {
  bool _tapped = false;
  bool _locked = false;
  bool _completed = false;

  @override
  void initState() {
    setState(() {
      _tapped = false;
      _locked = false;
    });
    widget.controller.setLock = setLock;
    if (widget.status == 'not completed') {
      setState(() {
        _locked = true;
        _completed = false;
      });
    }
    if (widget.status == 'completed') {
      setState(() {
        _locked = true;
        _completed = true;
      });
    }
    if (widget.status == 'ready') {
      setState(() {
        _locked = false;
        _completed = false;
      });
    }
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
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.leftPadding, right: widget.rightPadding),
        child: SizedBox(
          width: 360 * viewportRatio,
          height: 64 * viewportRatio,
          child: Center(
            child: _completed
                ? SizedBox(
                    width: 62 * viewportRatio,
                    height: 64 * viewportRatio,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 8 * viewportRatio,
                          child: Container(
                            width: 62 * viewportRatio,
                            height: 56 * viewportRatio,
                            decoration: const ShapeDecoration(
                              color: ColorStyles.mossGreen,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0 * viewportRatio,
                          child: Container(
                            width: 62 * viewportRatio,
                            height: 56 * viewportRatio,
                            decoration: const ShapeDecoration(
                              color: ColorStyles.leafGreen,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 6 * viewportRatio,
                          top: 6 * viewportRatio,
                          child: Container(
                            width: (62 - 12) * viewportRatio,
                            height: (56 - 12) * viewportRatio,
                            decoration: const ShapeDecoration(
                              color: ColorStyles.semiLightGreen,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24 * viewportRatio,
                          top: 0 * viewportRatio,
                          child: Transform.rotate(
                            angle: 0.75,
                            child: Container(
                              width: 10 * viewportRatio,
                              height: 50 * viewportRatio,
                              decoration: ShapeDecoration(
                                color: ColorStyles.leafGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ShapeStyles.cornerRadius / 5.0)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 44 * viewportRatio,
                          top: 23 * viewportRatio,
                          child: Transform.rotate(
                            angle: 0.75,
                            child: Container(
                              width: 9 * viewportRatio,
                              height: 34 * viewportRatio,
                              decoration: ShapeDecoration(
                                color: ColorStyles.leafGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0 * viewportRatio,
                          child: VCCircleButtonBase(
                            fillColor: Colors.transparent,
                            iconName: "${widget.iconName}_icon_white",
                          ),
                        ),
                      ],
                    ),
                  )
                : _locked
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
