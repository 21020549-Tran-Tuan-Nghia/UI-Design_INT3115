import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 247, 251),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(
              color: Color(0xFFD76AAB),
              strokeWidth: 6,
              strokeCap: StrokeCap.round),
          SizedBox(height: 20),
          Text('Đang tải ...',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF45A304)))
        ]),
      ),
    );
  }
}