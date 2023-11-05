import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/question_controller.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/questions/widgets/question_item.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final QuestionController _controller = QuestionController();

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await _controller.fetchQuestions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.isLoading
        ? const LoadingView()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate to another page when the arrow button is clicked.
                  Navigator.pushNamed(context, AppRoutes.map);
                },
              ),
              title: const Center(
                  child: Text("Bối cảnh",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 32,
                      ))),
              backgroundColor: Colors.amberAccent,
            ),
            body: Center(
              child: Column(children: [
                SizedBox(
                    width: 300, // Adjust the width as needed
                    height: 600, // Adjust the height as needed
                    child: Container(
                        color: Colors.grey,
                        child: Stack(
                          children: [
                            Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.play_circle,
                                  size: 48, // Adjust the size as needed
                                ),
                                onPressed: () =>
                                    Navigator.pushNamed(context, AppRoutes.map),
                              ),
                            ),
                          ],
                        )))
              ]),
            ));
  }
}
