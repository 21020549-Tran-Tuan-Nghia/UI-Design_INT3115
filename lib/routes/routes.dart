import 'package:flutter/material.dart';
import 'package:viet_chronicle/views/login/login_view.dart';
import 'package:viet_chronicle/views/map/map_view.dart';
import 'package:viet_chronicle/views/quiz/quiz_view.dart';
import 'package:viet_chronicle/views/register/register_view.dart';
import 'package:viet_chronicle/views/register_success/register_success_view.dart';
import 'package:viet_chronicle/views/unit/unit_view.dart';
import 'package:viet_chronicle/views/video/video_view.dart';

class AppRoutes {
  AppRoutes._();
  static String get loginView => 'login-view';
  static String get mapView => 'map-view';
  static String get registerView => 'register-view';
  static String get registerSuccessView => 'register-success-view';
  static String get quizView => 'quiz-view';
  static String get videoView => 'video-view';
  static String get unitView => 'unit-view';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginView: (context) => LoginView(),
    mapView: (context) => MapView(),
    registerView: (context) => RegisterView(),
    registerSuccessView: (context) => RegisterSuccessView(),
    quizView: (context) => QuizView(),
    videoView: (context) => VideoView(),
    unitView: (context) => UnitView(),
  };
}
