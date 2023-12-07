import "package:flutter/material.dart";
import "package:viet_chronicle/utils/styles.dart";
import "package:viet_chronicle/views/widgets/progress_bar/progress_bar_controller/vc_progress_bar_controller.dart";

class VCProgressBar extends StatefulWidget {
  final VCProgressBarController vcProgressBarController;
  final Color valueColor;
  final Color backgroundColor;
  final double borderRadius;

  const VCProgressBar({
    super.key,
    required this.vcProgressBarController,
    required this.valueColor,
    required this.backgroundColor,
    this.borderRadius = 25.0,
  });

  @override
  _VcProgressBarState createState() => _VcProgressBarState();
}

class _VcProgressBarState extends State<VCProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 236 * viewportRatio,
      child: LinearProgressIndicator(
        minHeight: 12 * viewportRatio,
        value: widget.vcProgressBarController.totalDuration != 0
            ? (widget.vcProgressBarController.currentDuration) /
                widget.vcProgressBarController.totalDuration
            : 0,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.valueColor,
        ),
        backgroundColor: widget.backgroundColor,
        borderRadius:
            BorderRadius.circular(widget.borderRadius * viewportRatio),
      ),
    );
  }
}
