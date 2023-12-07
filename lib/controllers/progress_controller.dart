
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class ProgressController {
  final Dio _dio = Dio();

  Future<void> createProgress(int lessonId, int subUnitId, int unitId) async {
    final String baseURL =
          await GlobalData.storage.read(key: "base_url") as String;
      final String adminSecret =
          await GlobalData.storage.read(key: "admin_secret") as String;
    try {
        String user_id = GlobalData.instance.user.id;
        var data = {
          "object": {
            "lesson_id": lessonId,
            "subunit_id": subUnitId,
            "unit_id": unitId,
            "user_id": user_id
          }};
        print(data);
        final response = await _dio.post("$baseURL/progress",
            options: Options(headers: {
              "content-type": "application/json",
              "x-hasura-admin-secret": adminSecret
            }),
            data: jsonEncode(data)
        );
        print(response.data);
      } catch (e) {
        print(e);
      }
  }
}