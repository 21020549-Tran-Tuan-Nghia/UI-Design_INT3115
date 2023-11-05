import 'package:flutter/material.dart';
import 'package:viet_chronicle/views/login/login_view.dart';
import 'package:viet_chronicle/views/questions/question.view.dart';
import 'package:viet_chronicle/views/register/register_view.dart';
// import 'package:viet_chronicle/views/register_success/register_success_view.dart';
import 'package:viet_chronicle/views/splash/splash_view.dart';
import 'package:viet_chronicle/views/map/map.dart';

class AppRoutes {
  AppRoutes._();
  static String get splashView => 'splash-view';
  static String get demoView => 'demo-view';
  static String get questionView => 'question-view';
  static String get loginView => 'login-view';
  static String get registerView => 'register-view';
  static String get registerSuccessView => 'register-success-view';
  static String get map => 'map';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashView: (context) => const SplashView(),
    questionView: (context) => const QuestionView(),
    loginView: (context) => LoginView(),
    registerView: (context) => RegisterView(),
    // registerSuccessView: (context) => const RegisterSuccessView(),
    map: (context) => MapView()
  };
}
