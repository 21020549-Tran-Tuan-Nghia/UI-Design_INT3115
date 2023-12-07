import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/progress_bar_controller/vc_progress_bar_controller.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/vc_progress_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoView extends StatefulWidget {
  final int lessonId;

  const VideoView({super.key, required this.lessonId});

  @override
  // ignore: library_private_types_in_public_api
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> with WidgetsBindingObserver {
  final VCButtonController btResumeController = VCButtonController();
  final VCProgressBarController vcProgressBarController =
      VCProgressBarController();

  bool _fetchState = false;

  late YoutubePlayerController youtubePlayerController;

  bool _isPlayerReady = false;
  late Duration _totalDuration;
  late Duration _currentPossition;
  bool isFullScreen = false;

  bool _isLock = true;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      setState(() {
        _fetchState = true;
      });
    });

    super.initState();

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://youtube.com/shorts/BsNlxjyURoo?si=ySB-_FHSlrkjpnXj')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(listener);
    _totalDuration = const Duration();
    _currentPossition = const Duration();

    btResumeController.setLock = setLock;

    WidgetsBinding.instance.addObserver(this);
  }

  void listener() {
    if (_isPlayerReady &&
        mounted &&
        !youtubePlayerController.value.isFullScreen) {
      setState(() {
        _totalDuration = youtubePlayerController.metadata.duration;
        _currentPossition = youtubePlayerController.value.position;
      });

      vcProgressBarController.totalDuration = _totalDuration.inMilliseconds;
      vcProgressBarController.currentDuration =
          _currentPossition.inMilliseconds;
    }
  }

  void setLock(bool newLock) {
    setState(() {
      _isLock = newLock;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
    return !_fetchState
        ? const LoadingView()
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: VCAppBar(
              backButtonColor: "gray",
              backgroundColor: Colors.transparent,
              titleColor: Colors.transparent,
              titleWidget: VCProgressBar(
                vcProgressBarController: vcProgressBarController,
                valueColor: ColorStyles.leafGreen,
                backgroundColor: ColorStyles.semiLightGray,
              ),
            ),
            body: Center(
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ShapeStyles.cornerRadius),
                      child: YoutubePlayer(
                        width: 312 * viewportRatio,
                        controller: youtubePlayerController,
                        // You can adjust this aspect ratio based on your preference
                        aspectRatio: 9 / 16,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        onReady: () {
                          _isPlayerReady = true;
                        },
                        onEnded: (YoutubeMetaData youtubeMetaData) {
                          btResumeController.setLock!(false);
                        },
                      ),
                    ),
                  ),
                  if (!isFullScreen)
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20 * viewportRatio),
                          child: VCButton.primaryGreen(
                            "Tiếp tục",
                            () {
                              Navigator.popAndPushNamed(
                                  context, AppRoutes.videoSummary);
                              // print(_currentPossition.inMilliseconds /
                              //     _videoMetaData.duration.inMilliseconds *
                              //     100);
                            },
                            btResumeController,
                            locked: _isLock,
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
