import 'package:flutter/material.dart';

class VCTextField extends StatelessWidget {
  final bool obscureText;

  final String labelText;
  final TextEditingController tfcontroller;

  const VCTextField(
      {super.key, required this.obscureText, required this.labelText, required this.tfcontroller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 264,
        height: 34,
        child: TextField(
            obscureText: obscureText,
            controller: tfcontroller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
              labelStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(179, 179, 179, 1)),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(179, 179, 179, 1), width: 2)),
            )));
  }
}
