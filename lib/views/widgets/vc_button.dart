import 'package:flutter/material.dart';

class VCButton extends StatefulWidget {
  final String labelText;
  final Color textColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback callback;

  const VCButton({
    super.key,
    required this.labelText,
    this.textColor = Colors.white,
    this.shadowColor = const Color(0xFF45A304),
    this.backgroundColor = const Color(0xFF56CD02),
    this.borderColor = const Color(0xFF56CD02),
    required this.callback,
  });

  @override
  State<VCButton> createState() => _VCButtonState();
}

class _VCButtonState extends State<VCButton> {
  bool _tapped = false;

  @override
  void initState() {
    _tapped = false;
    super.initState();
  }

  void handleTap() {
    setState(() {
      _tapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              handleTap(),
              widget.callback.call(),
              Future.delayed(const Duration(milliseconds: 100))
                  .whenComplete(() => setState(() {
                        _tapped = false;
                      }))
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
