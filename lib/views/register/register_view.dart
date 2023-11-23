import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/register_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/small_button/vc_small_button.dart';
import 'package:viet_chronicle/views/widgets/text_field/vc_text_field.dart';

class RegisterView extends StatelessWidget {
  // Register Controller
  final RegisterController registerController = RegisterController();

  // Text Field Controller
  final TextEditingController tfUsernameController = TextEditingController();
  final TextEditingController tfEmailController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();
  final TextEditingController tfRePasswordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                'Đăng ký',
                textAlign: TextAlign.center,
                style: HeadingStyle(newColor: ColorStyles.lotusPink),
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

              // Email Text Field
              VCTextField(
                hintText: "Email",
                tfController: tfEmailController,
              ),

              const SizedBox(
                height: 12 * viewportRatio,
              ),

              // Password Text Field
              VCTextField(
                hintText: "Mật khẩu",
                isObscureText: true,
                tfController: tfPasswordController,
              ),

              const SizedBox(
                height: 12 * viewportRatio,
              ),

              // RePassword Text Field
              VCTextField(
                hintText: "Nhập lại mật khẩu",
                isObscureText: true,
                tfController: tfRePasswordController,
              ),

              const SizedBox(
                height: 24 * viewportRatio,
              ),

              // Register Button
              VCSmallButton.primaryPink("ĐĂNG KÝ", () async {
                if (await registerController.register(
                    username: tfUsernameController.text,
                    email: tfEmailController.text,
                    password: tfPasswordController.text,
                    repassword: tfRePasswordController.text)) {
                  Navigator.popAndPushNamed(
                      context, AppRoutes.registerSuccessView);
                } else {
                  // Navigator.popAndPushNamed(context, AppRoutes.loginView);
                }
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
