import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viet_chronicle/controllers/login_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/login_break/vc_login_break.dart';
import 'package:viet_chronicle/views/widgets/small_button/vc_small_button.dart';
import 'package:viet_chronicle/views/widgets/text_field/vc_text_field.dart';

class LoginView extends StatelessWidget {
  // Login Controller
  final LoginController loginController = LoginController();

  // Text Field Controller
  final TextEditingController tfUsernameController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  'assets/images/app_portrait.png',
                  height: 325 * viewportRatio,
                ),
              ),

              // Title
              const Text(
                'Đăng nhập',
                textAlign: TextAlign.center,
                style: HeadingStyle(newColor: ColorStyles.leafGreen),
              ),

              const SizedBox(
                height: 24 * viewportRatio,
              ),

              // Usename Text Field
              VCTextField(
                hintText: "Tên đăng nhập",
                tfController: tfUsernameController,
              ),

              const SizedBox(
                height: 12 * viewportRatio,
              ),

              // Password Text Field
              VCTextField(
                hintText: "Mật khẩu",
                isObscureText: true,
                suffixText: "QUÊN?",
                tfController: tfPasswordController,
              ),

              const SizedBox(
                height: 24 * viewportRatio,
              ),

              // Login Button
              VCSmallButton.primaryGreen("ĐĂNG NHẬP", () async {
                if (await loginController.login(
                    username: tfUsernameController.text,
                    password: tfPasswordController.text)) {
                  Navigator.popAndPushNamed(context, AppRoutes.mapView);
                } else {
                  // Navigator.popAndPushNamed(context, AppRoutes.loginView);
                }
              }),

              const SizedBox(
                height: 16 * viewportRatio,
              ),

              const VCLoginBreak(),

              const SizedBox(
                height: 16 * viewportRatio,
              ),

              // Register Button
              VCSmallButton.secondaryPink("ĐĂNG KÝ", () {
                Navigator.popAndPushNamed(context, AppRoutes.registerView);
              }),

              const SizedBox(
                height: 24 * viewportRatio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
