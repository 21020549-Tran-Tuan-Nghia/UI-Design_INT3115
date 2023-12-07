import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viet_chronicle/routes/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: "Viet Chronicle",
      initialRoute: AppRoutes.splashView,
      routes: AppRoutes.routes,
    );
  }
}
