import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';

class VCTextField extends StatelessWidget {
  final bool isObscureText;
  final String obscureCharacter;
  final String hintText;
  final String suffixText;

  const VCTextField({
    super.key,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.suffixText = "",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264,
      height: 34,
      child: TextFormField(
        obscureText: isObscureText,
        obscuringCharacter: obscureCharacter,
        cursorColor: ColorStyles.semiDarkGray,
        style: const SubHeadingStyle(newColor: ColorStyles.semiDarkGray),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
          filled: true,
          fillColor: ColorStyles.lightGray,
          focusColor: ColorStyles.snowWhite,
          hintText: hintText,
          hintStyle: const SubHeadingStyle(newColor: ColorStyles.mediumGray),
          suffixText: suffixText,
          suffixStyle: const HeadingStyle(newColor: ColorStyles.semiDarkGray)
              .copyWith(fontSize: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: ColorStyles.mediumGray,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: ColorStyles.mediumGray,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: ColorStyles.mediumGray,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
