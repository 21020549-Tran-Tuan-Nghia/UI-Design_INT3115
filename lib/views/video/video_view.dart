import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/video_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatefulWidget {
  final int lessonId;

  VideoView({Key? key, required this.lessonId});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> with WidgetsBindingObserver {
  final VideoController videoController = VideoController();

  final VCButtonController btResumeController = VCButtonController();
  bool isFullScreen = false;
  bool _fetchState = false;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await videoController.fetchVideo(widget.lessonId);
      setState(() {
        _fetchState = true;
      });
    });
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // This method is called when there is a change in the app's layout metrics,
    // which can happen when entering or exiting full-screen mode.
    final bool isCurrentlyFullScreen =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isFullScreen != isCurrentlyFullScreen) {
      setState(() {
        isFullScreen = isCurrentlyFullScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_fetchState ? 
      const LoadingView()
    : Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
                  child: YoutubePlayer(
                    // width: 312 * viewportRatio,
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(
                          videoController.videoURL)!,
                      flags: const YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                    aspectRatio: 16 /
                        9, // You can adjust this aspect ratio based on your preference
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                  ),
                ),
              ),
            ),
            if (!isFullScreen)
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                    child: VCButton.primaryGreen(
                      "Tiếp tục",
                      () {
                        Navigator.popAndPushNamed(context, AppRoutes.mapView);
                      },
                      btResumeController,
                      locked: false,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
