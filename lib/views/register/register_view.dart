import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';
import 'package:viet_chronicle/views/widgets/vc_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController tfUsernameController = TextEditingController();
  final TextEditingController tfEmailController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();
  final TextEditingController tfRePasswordController = TextEditingController();

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
        const Text("Đăng ký",
            style: TextStyle(
                fontSize: 24,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w800,
                color: Color(0xFFFF87D2))),
        const SizedBox(height: 24),
        VCTextField(
            obscureText: false,
            labelText: "Tên đăng nhập",
            tfcontroller: tfUsernameController),
        const SizedBox(height: 12),
        VCTextField(
            obscureText: false,
            labelText: "Email",
            tfcontroller: tfEmailController),
        const SizedBox(height: 12),
        VCTextField(
            obscureText: true,
            labelText: "Mật khẩu",
            tfcontroller: tfPasswordController),
        const SizedBox(height: 12),
        VCTextField(
            obscureText: true,
            labelText: "Nhập lại mật khẩu",
            tfcontroller: tfRePasswordController),
        const SizedBox(height: 24),
        VCButton(
          labelText: "ĐĂNG KÝ",
          textColor: Colors.white,
          backgroundColor: const Color(0xFFFF87D2),
          shadowColor: const Color(0xFFD76AAB),
          borderColor: const Color(0xFFFF87D2),
          callback: () => {
            Navigator.popAndPushNamed(context, AppRoutes.registerSuccessView)
          },
        ),
      ],
    ));
  }
}
