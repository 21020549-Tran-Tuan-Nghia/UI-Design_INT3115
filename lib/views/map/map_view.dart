import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/map_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/map/widgets/sub_unit_list.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
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

  // State
  bool _fetchState = false;

  int _unitId = -1;
  int _subUnitId = 1;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await mapController.getUserData();
      setState(() {
        _fetchState = true;
      });
    });

    // Initialize Unit ID
    setState(() {
      _unitId = mapController.getUnitId();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            !_fetchState
                ? const SizedBox(
                    height: 10,
                  )
                : ListView.builder(
                    primary: true,
                    padding: const EdgeInsets.only(
                        top: 162 * viewportRatio, bottom: 162 * viewportRatio),
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
                            lessons:
                                mapController.getSubUnitLesson(_unitId, index),
                            mapController: mapController),
                      );
                    },
                  ),
            Container(
              height: 150 * viewportRatio,
              alignment: Alignment.topCenter,
              decoration: ShapeDecoration(
                color: ColorStyles.snowWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ShapeStyles.cornerRadius),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15 * viewportRatio),
                    child: SizedBox(height: 32 * viewportRatio),
                  ),
                  VCUnitButton(
                    titleText: mapController.convertTitle(
                        mapController.getSubUnit(_unitId, _subUnitId).title ??
                            ''),
                    subText: "CHƯƠNG ${_unitId + 1}, CỬA ${_subUnitId + 1}",
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
