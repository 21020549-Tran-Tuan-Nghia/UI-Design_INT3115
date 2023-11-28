import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 6,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: Color(0xFF45A304),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: Color(0xFF45A304),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 36,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: Color(0xFF45A304),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 48,
            top: 0,
            child: Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: Color(0xFF45A304),
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
