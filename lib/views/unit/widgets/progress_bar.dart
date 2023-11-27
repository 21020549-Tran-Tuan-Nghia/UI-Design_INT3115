import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 249,
      height: 24,
      child: Stack(
        children: [
          Positioned(
            left: 213,
            top: 1,
            child: SizedBox(
              width: 36,
              height: 16,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1',
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
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '/ 7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
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
            child: Container(
              width: 197,
              height: 16,
              decoration: BoxDecoration(
                color: ColorStyles.gray,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 4,
            child: Container(
              width: 52,
              height: 16,
              decoration: BoxDecoration(
                color: ColorStyles.snowWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              ),
            ),
        ],
      ),
    );
  }
}
