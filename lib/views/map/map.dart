import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/views/widgets/lesson_circle.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CHƯƠNG 1: THỜI KÌ BẮC THUỘC\n LẦN 1 (208TCN - 39)'),
          backgroundColor: Color(0xFF45A304),
        ),
        body: Column(
          children: [
            // StudyPathMap(),
            Circle(
              labelText: "1",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.videoView)},
              left: 140,
              top: 20,
            ),
            Circle(
              labelText: "2",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.questionView)},
              left: 210,
              top: 20,
            ),
            Circle(
              labelText: "3",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.questionView)},
              left: 280,
              top: 20,
            ),
            Circle(
              labelText: "4",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.questionView)},
              left: 210,
              top: 20,
            ),
            Circle(
              labelText: "5",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.questionView)},
              left: 140,
              top: 20,
            ),
            Circle(
              labelText: "6",
              textColor: Colors.white,
              backgroundColor: Color(0xFF45A304),
              borderColor: Color(0xFF45A304),
              callback: () =>
                  {Navigator.popAndPushNamed(context, AppRoutes.questionView)},
              left: 210,
              top: 20,
            ),
          ],
        ),
      ),
    );
  }
}
