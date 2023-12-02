import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';

class VideoSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Summary'),
        backgroundColor: Color.fromARGB(255, 86, 205, 2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Video Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This is a brief description of the video. It can contain important information about the content.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.videoView);
              },
              child: Row(
                children: [
                  Text(
                    'Take Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 86, 205, 2),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Color.fromARGB(255, 86, 205, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
