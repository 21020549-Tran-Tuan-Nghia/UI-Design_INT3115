import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class Exp extends StatelessWidget {
  late int exp;
  Exp({super.key, required this.exp});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 144 * viewportRatio,
          height: 80 * viewportRatio,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 144 * viewportRatio,
                  height: 80 * viewportRatio,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF87D2),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFFF87D2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2 * viewportRatio,
                top: 26 * viewportRatio,
                child: Container(
                  width: 140 * viewportRatio,
                  height: 52 * viewportRatio,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 144 * viewportRatio,
                  height: 80 * viewportRatio,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFFF87D2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 8 * viewportRatio,
                child: SizedBox(
                  width: 144 * viewportRatio,
                  height: 23 * viewportRatio,
                  child: Text(
                    'TỔNG ĐIỂM KN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 40 * viewportRatio,
                child: SizedBox(
                  width: 144 * viewportRatio,
                  height: 23 * viewportRatio,
                  child: Text(
                    exp.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD76AAB),
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}