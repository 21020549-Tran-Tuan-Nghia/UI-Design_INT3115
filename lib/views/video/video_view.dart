import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
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
  bool _fetchState = false;

  late PlayerState _playerState;
  late Duration _totalDuration;
  late Duration _currentPossition;
  bool isFullScreen = false;
  bool _fetchState = false;

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
    _playerState = PlayerState.unknown;

    btResumeController.setLock = setLock;

    WidgetsBinding.instance?.addObserver(this);
  }

  void listener() {
    if (_isPlayerReady &&
        mounted &&
        !youtubePlayerController.value.isFullScreen) {
      setState(() {
        _playerState = youtubePlayerController.value.playerState;
        _totalDuration = youtubePlayerController.metadata.duration;
        _currentPossition = youtubePlayerController.value.position;
      });
    }
  }

  void setLock(bool newLock) {
    setState(() {
      _isLock = newLock;
    });
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
    return !_fetchState
        ? const LoadingView()
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: VCAppBar(
              backButtonColor: "gray",
              backgroundColor: Colors.transparent,
              titleColor: Colors.transparent,
              titleWidget: SizedBox(
                width: 236 * viewportRatio,
                child: LinearProgressIndicator(
                  minHeight: 12 * viewportRatio,
                  value: _totalDuration != const Duration()
                      ? (_currentPossition.inMilliseconds) /
                          _totalDuration.inMilliseconds
                      : 0,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    ColorStyles.leafGreen,
                  ),
                  backgroundColor: ColorStyles.semiLightGray,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            body: Center(
              child: Stack(
                children: [
                  Container(
                    child: Center(
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