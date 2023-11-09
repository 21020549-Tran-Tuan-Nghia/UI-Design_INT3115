import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/vc_small_button.dart';
import 'package:viet_chronicle/views/widgets/vc_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Image.asset('assets/images/logo.png'),
            ),

            // Title
            const Text(
              'Đăng nhập',
              textAlign: TextAlign.center,
              style: HeadingStyle(newColor: ColorStyles.leafGreen),
            ),

            const SizedBox(
              height: 24,
            ),

            // Text Field
            const VCTextField(
              hintText: "Email hoặc tên đăng nhập",
            ),
            const SizedBox(
              height: 12,
            ),
            const VCTextField(
              hintText: "Mật khẩu",
              isObscureText: true,
              suffixText: "QUÊN?",
            ),

            const SizedBox(
              height: 24,
            ),
            VCSmallButton(labelText: "ĐĂNG NHẬP", callback: () => {}),

            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('ĐĂNG KÝ'),
            ),
          ],
        ),
      ),
    );
  }
}
