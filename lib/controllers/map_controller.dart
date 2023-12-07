import 'package:dio/dio.dart';
import 'package:viet_chronicle/models/lesson.dart';
import 'package:viet_chronicle/models/progress.dart';
import 'package:viet_chronicle/models/subunit.dart';
import 'package:viet_chronicle/models/unit.dart';
import 'package:viet_chronicle/models/user.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class MapController {
  final Dio _dio = Dio();

  MapController();

  Future<bool> getUserData() async {
    String? token = await GlobalData.instance.getSession("token");
    token ??= "";
    if (token.isEmpty) {
      return false;
    }
    try {
      if (GlobalData.instance.needUpdate) {
        final String baseURL =
            await GlobalData.storage.read(key: "base_url") as String;
        final userResponse = await _dio.get("$baseURL/user",
            options: Options(headers: {
              "content-type": "application/json",
              "Authorization": "Bearer $token"
            }));
        GlobalData.instance.user = User.fromJson(userResponse.data);
        final programResponse = await _dio.get("$baseURL/get_user_progress",
            options: Options(headers: {
              "content-type": "application/json",
              "Authorization": "Bearer $token"
            }),
            queryParameters: {
              "id": GlobalData.instance.user.id,
            });
        GlobalData.instance.progress =
            Progress.fromJson(programResponse.data["getProgress"]);
      }

      // Initialize Unit
      if (GlobalData.instance.needUpdate) {
        GlobalData.instance.unitReady = -1;
        GlobalData.instance.subUnitReady = -1;
        GlobalData.instance.lessonReady = -1;
        int unitLength = GlobalData.instance.progress.units!.length;
        for (int i = 0; i < unitLength; i += 1) {
          int subUnitLength =
              GlobalData.instance.progress.units![i].subunits.length;
          for (int j = 0; j < subUnitLength; j += 1) {
            int lessonLength = GlobalData
                .instance.progress.units![i].subunits[j].lessons.length;
            for (int k = 0; k < lessonLength; k += 1) {
              if (GlobalData.instance.progress.units![i].subunits[j].lessons[k]
                      .status ==
                  "not completed") {
                GlobalData.instance.unitReady = i;
                GlobalData.instance.subUnitReady = j;
                GlobalData.instance.lessonReady = k;
                break;
              }
            }
            if (GlobalData.instance.unitReady != -1) {
              break;
            }
          }
          if (GlobalData.instance.unitReady != -1) {
            break;
          }
        }
        GlobalData
            .instance
            .progress
            .units![GlobalData.instance.unitReady]
            .subunits[GlobalData.instance.subUnitReady]
            .lessons[GlobalData.instance.lessonReady]
            .status = "ready";

        if (GlobalData.instance.unit == -1) {
          GlobalData.instance.unit = GlobalData.instance.unitReady;
        }

        GlobalData.instance.needUpdate = false;
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Unit getUnit(int unitId) {
    return GlobalData.instance.progress.units![unitId];
  }

  SubUnit getSubUnit(int unitId, int subUnitId) {
    return getUnit(unitId).subunits[subUnitId];
  }

  List<Lesson> getSubUnitLesson(int unitId, int subUnitId) {
    List<Lesson> lessons = <Lesson>[];
    SubUnit currentSubUnit = getSubUnit(unitId, subUnitId);
    int lessonLength = currentSubUnit.lessons.length;
    for (int i = 0; i < lessonLength; i += 1) {
      lessons.add(currentSubUnit.lessons[i]);
    }
    return lessons;
  }

  List<Lesson> getAllLesson(int unitId) {
    List<Lesson> lessons = <Lesson>[];
    Unit currentUnit = getUnit(unitId);
    for (int i = 0; i < currentUnit.subunits.length; i += 1) {
      int lessonLength = currentUnit.subunits[i].lessons.length;
      for (int j = 0; j < lessonLength; j += 1) {
        lessons.add(currentUnit.subunits[i].lessons[j]);
      }
    }
    return lessons;
  }

  String convertTitle(String src) {
    String des = '';
    for (int i = 0; i < src.length; i += 1) {
      if (src[i] == '(') {
        des += "\n";
      }
      des += src[i];
    }
    return des;
  }

  void setUnitId(int newUnitId) {
    GlobalData.instance.unit = newUnitId;
  }

  int getUnitId() {
    return GlobalData.instance.unit;
  }
}
