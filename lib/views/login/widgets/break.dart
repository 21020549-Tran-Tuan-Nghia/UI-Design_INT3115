import 'package:flutter/material.dart';

class Break extends StatelessWidget {
  const Break({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264,
      height: 17,
      child: Stack(
        children: [
          const Positioned(
            left: 98,
            top: 0,
            child: SizedBox(
              width: 68,
              height: 17,
              child: Text(
                'HOẶC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 9,
            child: Container(
              width: 97,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 167,
            top: 9,
            child: Container(
              width: 97,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
