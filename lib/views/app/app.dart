import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Viet Chronicle",
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch: Colors.deepPurple,
      //   ),
      //   useMaterial3: true,
      // ),
      initialRoute: AppRoutes.splashView,
      routes: AppRoutes.routes,
    );
  }
}
