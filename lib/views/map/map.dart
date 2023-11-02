import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CHƯƠNG 1: THỜI KÌ BẮC THUỘC\n LẦN 1 (208TCN - 39)'),
          backgroundColor: Color(0xFF45A304),
        ),
        body: StudyPathMap(),
      ),
    );
  }
}

class StudyPathMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(200, 400), // Adjust the size as needed
        painter: StudyPathPainter(),
      ),
    );
  }
}

class StudyPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the positions and lesson numbers
    List<Offset> circlePositions = [
      Offset(100, -100),
      Offset(150, 15),
      Offset(180, 130),
      Offset(150, 245),
      Offset(100, 360),
      Offset(150, 475),
    ];
    List<String> lessonNumbers = ['1', '2', '3', '4', '5', '6'];

    // Define the paint properties for the circles and lines
    Paint circlePaint = Paint()
      ..color = Color(0xFF45A304)
      ..style = PaintingStyle.fill;

    // Define the size of each circle
    double circleRadius = 35.0; // Change the size here

    // Draw the circles and lines on the canvas
    for (int i = 0; i < circlePositions.length - 1; i++) {
      // Draw the circle
      canvas.drawCircle(circlePositions[i], circleRadius, circlePaint);

      // Draw the lesson number vertically
      TextSpan span = TextSpan(
          text: lessonNumbers[i],
          style: TextStyle(color: Colors.white, fontSize: 30));
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas,
          Offset(circlePositions[i].dx - 10, circlePositions[i].dy - 10));
    }

    // Draw the last circle
    canvas.drawCircle(circlePositions.last, circleRadius, circlePaint);
    TextSpan span = TextSpan(
      text: lessonNumbers.last,
      style: TextStyle(color: Colors.white, fontSize: 30),
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas,
        Offset(circlePositions.last.dx - 10, circlePositions.last.dy - 10));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
