import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';

class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 24),
            const Text('Đăng ký thành công!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD76AAB),
                  fontSize: 24,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  height: 0,
                )),
            const SizedBox(height: 24),
            const Text(
              'Chào mừng bạn tới Viet Chronicles,\nchúc bạn có những bài học thú vị và bổ ích.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFF87D2),
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
        SafeArea(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: VCButton(
                      labelText: "Tiếp tục",
                      backgroundColor: Color(0xFFFF87D2),
                      borderColor: Color(0xFFFF87D2),
                      shadowColor: Color(0xFFD76AAB),
                      callback: () => {
                            Navigator.popAndPushNamed(
                                context, AppRoutes.loginView)
                          }),
                ))),
      ]),
    );
  }
}
