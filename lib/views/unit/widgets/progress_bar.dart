import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class ProgressBar extends StatelessWidget {
  int length = 7;
  int current = 1;
  ProgressBar({super.key, required this.length, required this.current});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 249 * viewportRatio,
      height: 24,
      child: Stack(
        children: [
          Positioned(
            left: 238,
            top: 2,
            child: SizedBox(
              width: 36 * viewportRatio,
              height: 16 * viewportRatio,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: current.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '/ ${length.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              left: 10,
              top: 4,
              child: SizedBox(
                  width: 197 * viewportRatio,
                  child: LinearProgressIndicator(
                    minHeight: 16 * viewportRatio,
                    value: current / length,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      ColorStyles.snowWhite,
                    ),
                    backgroundColor: ColorStyles.gray,
                    borderRadius: BorderRadius.circular(25),
                  )))
        ],
      ),
    );
  }
}
