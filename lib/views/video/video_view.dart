// import 'package:flutter/material.dart';
// import 'package:viet_chronicle/routes/routes.dart';
// import 'package:viet_chronicle/utils/styles.dart';
// import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
// import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoView extends StatelessWidget {
//   final VCButtonController btResumeController = VCButtonController();

//   VideoView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             Container(
//               // alignment: Alignment.center,
//               // width: 360 * viewportRatio,
//               // height: 602 * viewportRatio,
//               // child: Padding(
//               //   padding: const EdgeInsets.all(24 * viewportRatio),
//               child: Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
//                   child: YoutubePlayer(
//                     // width: 312 * viewportRatio,
//                     controller: YoutubePlayerController(
//                       initialVideoId: YoutubePlayer.convertUrlToId(
//                           'https://youtu.be/Tlg574e9fuU?si=QKLp_VoS1FA4m6LC')!,
//                       flags: const YoutubePlayerFlags(
//                         autoPlay: true,
//                         mute: false,
//                       ),
//                     ),
//                     aspectRatio: 16 /
//                         9, // You can adjust this aspect ratio based on your preference
//                     showVideoProgressIndicator: true,
//                     progressIndicatorColor: Colors.amber,
//                   ),
//                 ),
//               ),
//             ),
//             SafeArea(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
//                   child: VCButton.primaryGreen(
//                     "Tiếp tục",
//                     () {
//                       Navigator.popAndPushNamed(context, AppRoutes.mapView);
//                     },
//                     btResumeController,
//                     locked: false,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatefulWidget {
  VideoView({Key? key}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> with WidgetsBindingObserver {
  final VCButtonController btResumeController = VCButtonController();
  bool isFullScreen = false;

  @override
  void initState() {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: VCAppBar(
        backButtonColor: "gray",
        titleColor: Colors.transparent,
        backgroundColor: ColorStyles.snowWhite,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
                  child: YoutubePlayer(
                    width: 312 * viewportRatio,
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(
                          'https://youtube.com/shorts/BsNlxjyURoo?si=ySB-_FHSlrkjpnXj')!,
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
            if (!isFullScreen)
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20 * viewportRatio),
                    child: VCButton.primaryGreen(
                      "Tiếp tục",
                      () {
                        Navigator.popAndPushNamed(
                            context, AppRoutes.videoSummary);
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
