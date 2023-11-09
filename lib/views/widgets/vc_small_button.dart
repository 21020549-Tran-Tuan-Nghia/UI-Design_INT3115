import 'package:flutter/material.dart';

class VCSmallButton extends StatefulWidget {
  final String labelText;
  final Color textColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback callback;

  const VCSmallButton({
    super.key,
    required this.labelText,
    this.textColor = Colors.white,
    this.shadowColor = const Color(0xFF45A304),
    this.backgroundColor = const Color(0xFF56CD02),
    this.borderColor = const Color(0xFF56CD02),
    required this.callback,
  });

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
              handleOnTapUp(),
              widget.callback.call(),
            },
        child: _tapped
            ? SizedBox(
                width: 264,
                height: 48,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                          width: 264,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: widget.backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    width: 2, color: widget.borderColor)),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              widget.labelText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.textColor,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: 264,
                height: 48,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 8,
                      child: Container(
                        width: 264,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: widget.shadowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                          width: 264,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: widget.backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    width: 2, color: widget.borderColor)),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              widget.labelText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.textColor,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ));
  }
}
