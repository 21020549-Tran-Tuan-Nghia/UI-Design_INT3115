import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/unit_controller.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/utils/utils.dart';
import 'package:viet_chronicle/views/unit/widgets/dots.dart';
import 'package:viet_chronicle/views/unit/widgets/single_unit_page.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';

class UnitView extends StatefulWidget {
  UnitView({super.key});

  @override
  State<UnitView> createState() => _UnitViewState();
}

class _UnitViewState extends State<UnitView> {
  // Unit Controller
  final UnitController unitController = UnitController();

  PageController pageController = PageController();

  // Button Controller
  final VCButtonController btResumeController = VCButtonController();

  // State
  bool _fetchState = false;

  int _unitId = -1;

  @override
  void initState() {
    Utils.onWidgetBuildDone(() async {
      await unitController.init();

      setState(() {
        _unitId = unitController.getUnitId();
      });

      pageController = PageController(initialPage: _unitId);

      setState(() {
        _fetchState = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VCAppBar.unitAppBar(
        "Lịch sử Văn hoá",
      ),
      backgroundColor: ColorStyles.leafGreen,
      body: _unitId == -1 || !_fetchState
          ? const SizedBox(
              height: 6.0,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _unitId = index;
                      });
                    },
                    children: List.generate(unitController.getNumberOfUnit(),
                        (index) {
                      return SingleUnitPage(
                          unitController: unitController, unitId: index);
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 78.0 * viewportRatio),
                  child: Dots(
                    numberOfUnit: unitController.getNumberOfUnit(),
                    currentUnit: _unitId,
                  ),
                ),
              ],
            ),
    );
  }
}