import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();

  VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VCAppBar.lessionAppBar(),
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: 360 * viewportRatio,
              height: 602 * viewportRatio,
              child: Padding(
                padding: const EdgeInsets.all(24 * viewportRatio),
                child: Center(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ShapeStyles.cornerRadius),
                    child: YoutubePlayer(
                      width: 312 * viewportRatio,
                      controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(
                            'https://youtube.com/shorts/BsNlxjyURoo?si=qaQFPLptqxvCKU_y')!,
                        flags: const YoutubePlayerFlags(
                          autoPlay: true,
                          mute: false,
                        ),
                      ),
                      aspectRatio: 9 /
                          16, // You can adjust this aspect ratio based on your preference
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                  child: VCButton.primaryGreen(
                    "Tiếp tục",
                    () {
                      // Navigator.popAndPushNamed(context, AppRoutes.mapView);
                    },
                    btResumeController,
                    locked: true,
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
