import 'package:flutter/material.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/views/loading/loading_view.dart';
import 'package:viet_chronicle/controllers/map_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/map/widgets/sub_unit_list.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/profile_icon/vc_profile_icon.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/progress_bar_controller/vc_progress_bar_controller.dart';
import 'package:viet_chronicle/views/widgets/progress_bar/vc_progress_bar.dart';
import 'package:viet_chronicle/views/widgets/small_level_icon/vc_small_level_icon.dart';
import 'package:viet_chronicle/views/widgets/unit_button/vc_unit_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MapView extends StatefulWidget {
  MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // Map Controller
  final MapController mapController = MapController();

  // Button Controller
  final VCButtonController controller = VCButtonController();

  // Progress Bar Controller
  final VCProgressBarController vcProgressBarController =
      VCProgressBarController();

  // State
  bool _fetchState = false;

  int _unitId = -1;
  int _subUnitId = 0;

  final currentEXP = 250;
  final maximumEXP = 1000;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await mapController.getUserData();

      // Initialize Unit ID
      setState(() {
        _unitId = mapController.getUnitId();
      });

      setState(() {
        _fetchState = true;
      });
    });

    vcProgressBarController.currentDuration = GlobalData.instance.user.exp;
    vcProgressBarController.totalDuration =
        ((GlobalData.instance.getUserLevel() + 1) * 1000);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VCAppBar(
        titleColor: ColorStyles.snowWhite,
        backgroundColor: ColorStyles.snowWhite,
        backButtonColor: 'gray',
        titleWidget: VCProgressBar(
          vcProgressBarController: vcProgressBarController,
          valueColor: ColorStyles.lotusPink,
          backgroundColor: ColorStyles.semiLightGray,
        ),
        showActionIcon: true,
        actionWidget: const VCProfileIcon(),
        onMenuActionTap: () {
          Navigator.pushNamed(context, AppRoutes.profileView);
        },
        leading: VcSmallLevelIcon(level: GlobalData.instance.getUserLevel()),
      ),
      body: !_fetchState || _unitId == -1
          ? const LoadingView()
          : Center(
              child: Stack(
                children: [
                  ListView.builder(
                    primary: true,
                    padding: const EdgeInsets.only(
                        top: 100 * viewportRatio, bottom: 100 * viewportRatio),
                    itemCount: mapController.getUnit(_unitId).subunits.length,
                    itemBuilder: (context, index) {
                      return VisibilityDetector(
                        key: Key(index.toString()),
                        onVisibilityChanged: (VisibilityInfo info) {
                          var visiblePercentage = info.visibleFraction * 100;
                          // debugPrint(
                          //     'Widget ${info.key} is ${visiblePercentage}% visible');
                          if (visiblePercentage > 50) {
                            //TODO: not the best solution!
                            setState(() {
                              _subUnitId = index;
                              // print(_subUnitId);
                            });
                          }
                        },
                        child: SubUnitList(
                            subUnitId: index,
                            lessons:
                                mapController.getSubUnitLesson(_unitId, index),
                            mapController: mapController),
                      );
                    },
                  ),
                  Container(
                    height: 88 * viewportRatio,
                    alignment: Alignment.topCenter,
                    decoration: ShapeDecoration(
                      color: ColorStyles.snowWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(ShapeStyles.cornerRadius),
                      ),
                    ),
                    child: Column(
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.all(15 * viewportRatio),
                        //   child: SizedBox(height: 32 * viewportRatio),
                        // ),
                        VCUnitButton(
                          titleText: mapController.convertTitle(mapController
                                  .getSubUnit(_unitId, _subUnitId)
                                  .title ??
                              ''),
                          subText:
                              "CHƯƠNG ${_unitId + 1}, CỬA ${_subUnitId + 1}",
                          callback: () {
                            Navigator.pushNamed(context, AppRoutes.unitView);
                          },
                          controller: controller,
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
