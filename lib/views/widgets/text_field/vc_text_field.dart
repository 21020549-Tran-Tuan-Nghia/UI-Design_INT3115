import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCTextField extends StatelessWidget {
  // Text Setting
  final bool isObscureText;
  final String obscureCharacter;
  final String hintText;
  final String suffixText;
  // Color
  final Color borderColor;
  final Color hintColor;
  final Color suffixColor;
  final Color textColor;
  final Color baseColor;
  // Controller
  final TextEditingController tfController;

  // Constructor
  const VCTextField({
    super.key,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.suffixText = "",
    this.borderColor = ColorStyles.mediumGray,
    this.hintColor = ColorStyles.mediumGray,
    this.suffixColor = ColorStyles.semiDarkGray,
    this.textColor = ColorStyles.semiDarkGray,
    this.baseColor = ColorStyles.lightGray,
    required this.tfController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Width & Height
      width: 264 * viewportRatio,
      height: 34 * viewportRatio,

      // Text Form
      child: TextFormField(
        // Obscure (password)
        obscureText: isObscureText,
        obscuringCharacter: obscureCharacter,

        // Styles & Text Align
        cursorColor: ColorStyles.semiDarkGray,
        // cursorHeight: 16,
        style: SubHeadingStyle(newColor: textColor)
            .copyWith(height: 18 * viewportRatio / 16 * viewportRatio),
        textAlignVertical: TextAlignVertical.center,

        // Decoration
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 6 * viewportRatio, horizontal: 12 * viewportRatio),

          // Fill Color
          filled: true,
          fillColor: baseColor,
          focusColor: ColorStyles.snowWhite,

          // Hint
          hintText: hintText,
          hintStyle: SubHeadingStyle(newColor: hintColor),

          // Suffix
          // suffixText: suffixText,
          // suffixStyle:
          //     HeadingStyle(newColor: suffixColor).copyWith(fontSize: 12),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12 * viewportRatio),
            child: Text(
              suffixText,
              style: HeadingStyle(newColor: suffixColor)
                  .copyWith(fontSize: 12 * viewportRatio),
              textAlign: TextAlign.center,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),

          // Border
          /// Default
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(ShapeStyles.cornerRadius),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: ShapeStyles.strokeWidth,
            ),
          ),

          /// Enable
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(ShapeStyles.cornerRadius),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: ShapeStyles.strokeWidth,
            ),
          ),

          /// Focused
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(ShapeStyles.cornerRadius),
            ),
            borderSide: BorderSide(
              color: borderColor,
              width: ShapeStyles.strokeWidth,
            ),
          ),
        ),

        // Controller
        controller: tfController,
      ),
    );
  }
}
