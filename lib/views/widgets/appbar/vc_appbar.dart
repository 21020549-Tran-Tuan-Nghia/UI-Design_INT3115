import "package:flutter/material.dart";
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VCAppBar({
    Key? key,
    this.title = '',
    required this.titleColor,
    required this.backgroundColor,
    required this.backButtonColor,
    this.leading,
    this.titleWidget,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final String backButtonColor;
  final Widget? leading;
  final Widget? titleWidget;

  factory VCAppBar.unitAppBar(title) {
    return VCAppBar(
      title: title,
      titleColor: ColorStyles.snowWhite,
      backgroundColor: ColorStyles.leafGreen,
      backButtonColor: "white",
    );
  }

  factory VCAppBar.lessionAppBar() {
    return const VCAppBar(
      titleColor: ColorStyles.darkGray,
      backgroundColor: ColorStyles.snowWhite,
      backButtonColor: "gray",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 360 * viewportRatio,
        height: 62 * viewportRatio,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * viewportRatio,
            vertical: 12 * viewportRatio,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: HeadingStyle(newColor: titleColor),
                        ),
                      )
                    : Center(
                        child: titleWidget,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.popAndPushNamed(context, AppRoutes.mapView);
                      }
                    },
                    child: leading ??
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/back_icon_$backButtonColor.png",
                            width: 32 * viewportRatio,
                            height: 32 * viewportRatio,
                          ),
                        ),
                  ),
                  //TODO: Adding Profile button
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
