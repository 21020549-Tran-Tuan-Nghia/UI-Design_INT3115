import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/login_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/login/widgets/break.dart';
import 'package:viet_chronicle/views/widgets/vc_text_field.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = LoginController();
  final TextEditingController tfUsernameController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();

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
        VCTextField(
            obscureText: false,
            labelText: "Email hoặc tên đăng nhập",
            tfcontroller: tfUsernameController),
        const SizedBox(height: 12),
        VCTextField(
            obscureText: true,
            labelText: "Mật khẩu",
            tfcontroller: tfPasswordController),
        const SizedBox(height: 24),
        VCButton(
          labelText: "ĐĂNG NHẬP",
          callback: () async {
            if (await loginController.login(
                username: tfUsernameController.text,
                password: tfPasswordController.text)) {
              Navigator.popAndPushNamed(context, AppRoutes.map);
            } else {
              // Navigator.popAndPushNamed(context, AppRoutes.loginView);
            }
          },
        ),
        const SizedBox(height: 16),
        const Break(),
        const SizedBox(height: 16),
        VCButton(
          labelText: "ĐĂNG KÝ",
          textColor: const Color(0xFFD76AAB),
          backgroundColor: Colors.white,
          shadowColor: const Color(0xFFD76AAB),
          borderColor: const Color(0xFFD76AAB),
          callback: () =>
              {Navigator.popAndPushNamed(context, AppRoutes.registerView)},
        ),
      ],
    ));
  }
}
