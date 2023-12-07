import 'package:flutter/material.dart';
import 'package:viet_chronicle/controllers/progress_controller.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/quiz_result/widgets/acc.dart';
import 'package:viet_chronicle/views/quiz_result/widgets/exp.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';

class QuizResultView extends StatelessWidget {
  late int total;
  late int count;
  late int lessonId;
  ProgressController progressController = ProgressController(); 

  QuizResultView(
      {super.key,
      required this.count,
      required this.total,
      required this.lessonId});

  VCButtonController btResumeController = VCButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: 250 * viewportRatio,
                ),
              ),
              const SizedBox(
                height: 30 * viewportRatio,
              ),
              const Text(
                "Bạn đã hoàn thành bài học",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD76AAB),
                  fontSize: 24,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 12 * viewportRatio,
              ),
              const Text(
                "Cố gắng giữ vững phong độ này nhé!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD76AAB),
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 39 * viewportRatio,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Exp(exp: (count / total * 100).round()),
                  const SizedBox(
                    width: 24 * viewportRatio,
                    height: 24 * viewportRatio,
                  ),
                  Acc(acc: (count / total * 20).round()),
                ],
              ),
              const SizedBox(
                height: 101 * viewportRatio,
              ),
              // Register Button
              SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 20 * viewportRatio),
                      child: VCButton.primaryPink(
                        "Tiếp tục",
                        () {
                          GlobalData.instance.updateUserData(
                              GlobalData.instance.user.streak,
                              GlobalData.instance.user.exp +
                                  (count / total * 100).round(),
                          );
                          int unitId = GlobalData.instance.getUnitID(GlobalData.instance.unit);
                          int subUnitId = GlobalData.instance.getSubUnitID(GlobalData.instance.unit, GlobalData.instance.subUnit);
                          int lessonId = GlobalData.instance.getLessonID(GlobalData.instance.unit, GlobalData.instance.subUnit, GlobalData.instance.lesson);
                          String status = GlobalData.instance.progress.units![GlobalData.instance.unit].subunits[GlobalData.instance.subUnit].lessons[GlobalData.instance.lesson].status;
                          if (status == 'not completed' || status == 'ready') {
                            progressController.createProgress(
                                lessonId,
                                subUnitId,
                                unitId,
                            );
                            GlobalData.instance.progress.units![GlobalData.instance.unit].subunits[GlobalData.instance.subUnit].lessons[GlobalData.instance.lesson].status = 'completed';
                            for (var lesson in GlobalData.instance.progress.units![GlobalData.instance.unit].subunits[GlobalData.instance.subUnit].lessons) {
                              if (lesson.status == 'not completed') {
                                GlobalData.instance.progress.units![GlobalData.instance.unit].subunits[GlobalData.instance.subUnit].status = 'not completed';
                                break;
                              }
                              GlobalData.instance.progress.units![GlobalData.instance.unit].subunits[GlobalData.instance.subUnit].status = 'completed';
                            }
                            for (var subunit in GlobalData.instance.progress.units![GlobalData.instance.unit].subunits) {
                              if (subunit.status == 'not completed') {
                                GlobalData.instance.progress.units![GlobalData.instance.unit].status = 'not completed';
                                break;
                              }
                              GlobalData.instance.progress.units![GlobalData.instance.unit].status = 'completed';
                            }
                            GlobalData.instance.needUpdate = true;
                          }
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
      ),
    );
  }
}
