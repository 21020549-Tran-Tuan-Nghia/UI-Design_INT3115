import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/question_controller.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/questions/widgets/question_item.dart';
import 'package:viet_chronicle/views/widgets/vc_button.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate to another page when the arrow button is clicked.
                  Navigator.pushNamed(context, AppRoutes.mapView);
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
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(
                        'https://youtube.com/shorts/BsNlxjyURoo?si=qaQFPLptqxvCKU_y')!,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  ),
                  aspectRatio: 9 /
                      16, // You can adjust this aspect ratio based on your preference
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                ),
              ]),
            ));
  }
}
