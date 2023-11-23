import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/answer_button/base/vc_answer_button_base.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';

class VCAnswerButton extends StatefulWidget {
  final String labelText;
  final Color normalTextColor;
  final Color selectedTextColor;
  final Color tappedTextColor;
  final Color normalColor;
  final Color normalShadowColor;
  final Color selectedColor;
  final Color selectedShadowColor;
  final VoidCallback callback;
  final VCButtonController controller;

  const VCAnswerButton({
    super.key,
    required this.labelText,
    this.normalTextColor = ColorStyles.semiDarkGray,
    this.selectedTextColor = ColorStyles.darkPink,
    this.tappedTextColor = ColorStyles.snowWhite,
    this.normalColor = ColorStyles.snowWhite,
    this.normalShadowColor = ColorStyles.mediumGray,
    this.selectedColor = ColorStyles.lightPink,
    this.selectedShadowColor = ColorStyles.darkPink,
    required this.callback,
    required this.controller,
  });

  @override
  State<VCAnswerButton> createState() => _VCSmallButtonState();
}

class _VCSmallButtonState extends State<VCAnswerButton> {
  bool _tapped = false;
  bool _locked = false;
  bool _selected = false;

  @override
  void initState() {
    _tapped = false;
    _locked = false;
    _selected = false;
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

  void setSelect(bool selectValue) {
    setState(() {
      _selected = !selectValue;
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
                .whenComplete(() => setSelect(_selected))
                .whenComplete(() => widget.callback.call()),
          }
      },
      child: _tapped && _selected
          ? SizedBox(
              width: 148 * viewportRatio,
              height: 176 * viewportRatio,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 8 * viewportRatio,
                    child: VcAnswerButtonBase(
                      fillColor: widget.selectedShadowColor,
                      borderColor: widget.selectedShadowColor,
                      labelColor: widget.tappedTextColor,
                      labelText: widget.labelText,
                    ),
                  ),
                ],
              ),
            )
          : !_tapped && _selected
              ? SizedBox(
                  width: 148 * viewportRatio,
                  height: 176 * viewportRatio,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 8 * viewportRatio,
                        child: VcAnswerButtonBase(
                          fillColor: widget.selectedShadowColor,
                          borderColor: widget.selectedShadowColor,
                          labelColor: widget.tappedTextColor,
                          labelText: "",
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0 * viewportRatio,
                        child: VcAnswerButtonBase(
                          fillColor: widget.selectedColor,
                          borderColor: widget.selectedShadowColor,
                          labelColor: widget.selectedTextColor,
                          labelText: widget.labelText,
                        ),
                      ),
                    ],
                  ),
                )
              : _tapped && !_selected
                  ? SizedBox(
                      width: 148 * viewportRatio,
                      height: 176 * viewportRatio,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 8 * viewportRatio,
                            child: VcAnswerButtonBase(
                              fillColor: widget.normalShadowColor,
                              borderColor: widget.normalShadowColor,
                              labelColor: widget.tappedTextColor,
                              labelText: widget.labelText,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: 148 * viewportRatio,
                      height: 176 * viewportRatio,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 8 * viewportRatio,
                            child: VcAnswerButtonBase(
                              fillColor: widget.normalShadowColor,
                              borderColor: widget.normalShadowColor,
                              labelColor: widget.tappedTextColor,
                              labelText: "",
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0 * viewportRatio,
                            child: VcAnswerButtonBase(
                              fillColor: widget.normalColor,
                              borderColor: widget.normalShadowColor,
                              labelColor: widget.normalTextColor,
                              labelText: widget.labelText,
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}
