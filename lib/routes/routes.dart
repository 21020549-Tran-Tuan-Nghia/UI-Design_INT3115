import 'package:flutter/material.dart';
import 'package:viet_chronicle/views/demo/demo_view.dart';
import 'package:viet_chronicle/views/questions/question.view.dart';
import 'package:viet_chronicle/views/splash/splash_view.dart';

class AppRoutes {

  AppRoutes._();
  static String get splashView => 'splash-view';
  static String get demoView => 'demo-view';
  static String get questionView => 'question-view';
  static Map<String, Widget Function(BuildContext)> routes = {
    splashView: (context) => const SplashView(),
    demoView: (context) => const DemoView(),
    questionView: (context) => const QuestionView(),
  };
}