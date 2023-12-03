import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/login_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final LoginController loginController = LoginController();

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await Future.delayed(const Duration(seconds: 2)).whenComplete(() async => {
          GlobalData.instance.init(),
          await loginController.getUserData() ? Navigator.pushReplacementNamed(context, AppRoutes.mapView) :
          Navigator.pushReplacementNamed(context, AppRoutes.loginView)
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorStyles.leafGreen,
      body: Center(
        child: Text("Viet Chronicle",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 40,
          ))),
    );
  }
}
