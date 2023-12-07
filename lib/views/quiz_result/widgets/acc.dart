import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

// ignore: must_be_immutable
class Acc extends StatelessWidget {
  late int acc;
  Acc({super.key, required this.acc});

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
                    color: Color(0xFF56CD02),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2 * viewportRatio, color: Color(0xFF56CD02)),
                      borderRadius: BorderRadius.circular(12 * viewportRatio),
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
                      borderRadius: BorderRadius.circular(10 * viewportRatio),
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
                      side: BorderSide(
                          width: 2 * viewportRatio, color: Color(0xFF56CD02)),
                      borderRadius: BorderRadius.circular(12 * viewportRatio),
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
                    acc.toString() + '%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF56CD02),
                      fontSize: 20 * viewportRatio,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * viewportRatio,
                top: 6 * viewportRatio,
                child: SizedBox(
                  width: 144 * viewportRatio,
                  height: 23 * viewportRatio,
                  child: Text(
                    'ĐỘ CHÍNH XÁC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13 * viewportRatio,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
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
