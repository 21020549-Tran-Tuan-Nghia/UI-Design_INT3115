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

  int unitId = 1;
  int subUnitId = 1;
  var lessons = List.empty();

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await mapController.getUserData();
      setState(() {
        _fetchState = true;
      });
    });

    // lessons = mapController.getSubUnit(unitId, subUnitId).lessons;
    lessons = mapController.getAllLesson(unitId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            mapController.getUnit(unitId).subunits.isEmpty
                ? const SizedBox(
                    height: 10,
                  )
                : ListView.builder(
                    primary: true,
                    padding: const EdgeInsets.only(
                        top: 162 * viewportRatio, bottom: 162 * viewportRatio),
                    itemCount: mapController.getUnit(unitId).subunits.length,
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
                              subUnitId = index;
                              // print(subUnitId);
                            });
                          }
                        },
                        child: SubUnitList(
                            lessons:
                                mapController.getSubUnitLesson(unitId, index),
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
                    // titleText: "THỜI KỲ BẮC THUỘC LẦN I\n(208 TCN - 39)",
                    titleText: mapController.convertTitle(
                        mapController.getSubUnit(unitId, subUnitId).title ??
                            ''),
                    subText: "CHƯƠNG ${unitId + 1}, CỬA ${subUnitId + 1}",
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
