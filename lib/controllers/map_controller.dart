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

    int rewardLength = 8 - lessonLength;
    if (rewardLength < 0) {
      rewardLength += 8;
    }

    for (int i = 0; i < rewardLength; i++) {
      lessons.add(Lesson(id: 0, lessonType: "reward", status: "not completed"));
    }
    lessons.add(Lesson(id: -1, lessonType: "tropy", status: "not completed"));
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

      int rewardLength = 8 - lessonLength;
      if (rewardLength < 0) {
        rewardLength += 8;
      }
      for (int j = 0; j < rewardLength; j++) {
        lessons
            .add(Lesson(id: 0, lessonType: "reward", status: "not completed"));
      }
      lessons.add(Lesson(id: -1, lessonType: "tropy", status: "not completed"));
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
}