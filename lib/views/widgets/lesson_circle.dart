import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  final String labelText;
  final Color textColor;
  // final Color shadowColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback callback;
  final double left; // Custom left position
  final double top; // Custom top position

  const Circle({
    super.key,
    required this.labelText,
    this.textColor = Colors.white,
    // this.shadowColor = const Color(0xFF45A304),
    this.backgroundColor = const Color(0xFF56CD02),
    this.borderColor = const Color(0xFF56CD02),
    required this.callback,
    this.left = 0, // Default to 0
    this.top = 0, // Default to 0
  });

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
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
                width: 400,
                height:
                    40, // Make the height equal to the width to create a circle
                child: Stack(
                  children: [
                    Positioned(
                      left: widget.left,
                      top: widget
                          .top, // Set the top to 0 to align the circular box within the SizedBox
                      child: Container(
                        width: 64,
                        height:
                            64, // Make the height equal to the width to create a circle
                        decoration: ShapeDecoration(
                          color: widget
                              .backgroundColor, // Set your desired background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                132), // Half of the width or height to create a circle
                            side: BorderSide(
                              width: 2, // Add a border if needed
                              color: widget.borderColor,
                            ),
                          ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: 400,
                height:
                    85, // Make the height equal to the width to create a circle
                child: Stack(
                  children: [
                    Positioned(
                      left: widget.left,
                      top: widget
                          .top, // Set the top to 0 to align the circular box within the SizedBox
                      child: Container(
                        width: 64,
                        height:
                            64, // Make the height equal to the width to create a circle
                        decoration: ShapeDecoration(
                          color: widget
                              .backgroundColor, // Set your desired background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                132), // Half of the width or height to create a circle
                            side: BorderSide(
                              width: 2, // Add a border if needed
                              color: widget.borderColor,
                            ),
                          ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
