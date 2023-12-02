import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView1 extends StatelessWidget {
  final VCButtonController btResumeController = VCButtonController();

  VideoView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              // alignment: Alignment.center,
              // width: 360 * viewportRatio,
              // height: 602 * viewportRatio,
              // child: Padding(
              //   padding: const EdgeInsets.all(24 * viewportRatio),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
                  child: YoutubePlayer(
                    // width: 312 * viewportRatio,
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(
                          'https://youtu.be/Tlg574e9fuU?si=QKLp_VoS1FA4m6LC')!,
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
              // ),
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
