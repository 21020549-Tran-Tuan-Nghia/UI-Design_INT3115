import 'package:flutter/material.dart';
import 'package:viet_chronicle/views/login/login_view.dart';

class AppRoutes {
  AppRoutes._();
  static String get loginView => 'login-view';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginView: (context) => const LoginView()
  };
}
