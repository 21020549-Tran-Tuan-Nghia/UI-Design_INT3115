import 'package:flutter/material.dart';
import 'package:viet_chronicle/views/login/widgets/break.dart';
import 'package:viet_chronicle/views/widgets/vc_text_field.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Image.asset('assets/images/logo.png'),
        ),
        const Text("Đăng nhập",
            style: TextStyle(
                fontSize: 24,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(86, 205, 2, 1))),
        const SizedBox(height: 40),
        const VCTextField(
            obscureText: false, labelText: "Email hoặc tên đăng nhập"),
        const SizedBox(height: 12),
        const VCTextField(obscureText: true, labelText: "Mật khẩu"),
        const SizedBox(height: 24),
        const VCButton(
          labelText: "ĐĂNG NHẬP", 
        ),
        const SizedBox(height: 16),
        const Break(),
        const SizedBox(height: 16),
        const VCButton(
          labelText: "ĐĂNG KÝ",
          textColor: Color(0xFFD76AAB),
          backgroundColor: Colors.white,
          shadowColor: Color(0xFFD76AAB),
          borderColor: Color(0xFFD76AAB),
        ),
      ],
    ));
  }
}
