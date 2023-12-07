import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viet_chronicle/controllers/progress_controller.dart';
import 'package:viet_chronicle/models/progress.dart';
import 'package:viet_chronicle/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

const notCompleted = "not completed";
const completed = "completed";

class GlobalData {
  GlobalData._();
  Dio _dio = Dio();
  static final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  static final GlobalData instance = GlobalData._();
  late User user;
  late Progress progress;

  // Save Unit, SubUnit & Lesson secsion
  late int unit = -1;
  late int subUnit = -1;
  late int lesson = -1;

  // The lastest lesson
  late int unitReady = -1;
  late int subUnitReady = -1;
  late int lessonReady = -1;
  late bool needUpdate = true;

  factory GlobalData() {
    return instance;
  }

  Future<void> saveSession(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getSession(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> updateUserData(int streak, int exp) async {
    final String baseURL =
        await GlobalData.storage.read(key: "base_url") as String;
    final String adminSecret =
        await GlobalData.storage.read(key: "admin_secret") as String;
    try {
      var data = {
        "object": {
          "streak": streak,
          "exp": exp,
        }
      };
      String id = user.id;
      final response = await _dio.post("$baseURL/users/$id",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": adminSecret
          }),
          data: jsonEncode(data));
      GlobalData.instance.user.exp = exp;
      GlobalData.instance.user.streak = streak;
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await storage.write(
        key: "keycloak_endpoint",
        value: const String.fromEnvironment('KEYCLOAK_ENDPOINT'));
    await storage.write(
        key: "base_url", value: const String.fromEnvironment('BASE_URL'));
    await storage.write(
        key: "admin_secret",
        value: const String.fromEnvironment('ADMIN_SECRET'));
  }

  // get ID method:
  int getUnitID(int unitIndex) {
    return GlobalData.instance.progress.units![unitIndex].id!;
  }

  int getSubUnitID(int unitIndex, int subUnitIndex) {
    return progress.units![unitIndex].subunits[subUnitIndex].id!;
  }

  int getLessonID(int unitIndex, int subUnitIndex, int lessonIndex) {
    return GlobalData.instance.progress.units![unitIndex].subunits[subUnitIndex]
        .lessons[lessonIndex].id;
  }

  // Update EXP:
  void updateEXP(int additionalEXP) {
    GlobalData.instance.updateUserData(
      GlobalData.instance.user.streak,
      GlobalData.instance.user.exp + additionalEXP,
    );
  }

  // Update Streak:
  void updateStreak() {
    GlobalData.instance.updateUserData(
        GlobalData.instance.user.streak + 1, GlobalData.instance.user.exp);
  }

  // Update Lesson after completed:
  void updateLesson() {
    // Getting ID:
    int unitId = GlobalData.instance.getUnitID(GlobalData.instance.unit);
    int subUnitId = GlobalData.instance
        .getSubUnitID(GlobalData.instance.unit, GlobalData.instance.subUnit);
    int lessonId = GlobalData.instance.getLessonID(GlobalData.instance.unit,
        GlobalData.instance.subUnit, GlobalData.instance.lesson);

    // Getting Status:
    String status = GlobalData
        .instance
        .progress
        .units![GlobalData.instance.unit]
        .subunits[GlobalData.instance.subUnit]
        .lessons[GlobalData.instance.lesson]
        .status;

    // Only Update if status is not completed or ready:
    if (status == 'not completed' || status == 'ready') {
      // Create new progress line:
      ProgressController progressController = ProgressController();
      progressController.createProgress(
        lessonId,
        subUnitId,
        unitId,
      );

      // Update
      GlobalData
          .instance
          .progress
          .units![GlobalData.instance.unit]
          .subunits[GlobalData.instance.subUnit]
          .lessons[GlobalData.instance.lesson]
          .status = 'completed';

      //
      for (var lesson in GlobalData
          .instance
          .progress
          .units![GlobalData.instance.unit]
          .subunits[GlobalData.instance.subUnit]
          .lessons) {
        if (lesson.status == 'not completed') {
          GlobalData.instance.progress.units![GlobalData.instance.unit]
              .subunits[GlobalData.instance.subUnit].status = 'not completed';
          break;
        }
        GlobalData.instance.progress.units![GlobalData.instance.unit]
            .subunits[GlobalData.instance.subUnit].status = 'completed';
      }

      //
      for (var subunit in GlobalData
          .instance.progress.units![GlobalData.instance.unit].subunits) {
        if (subunit.status == 'not completed') {
          GlobalData.instance.progress.units![GlobalData.instance.unit].status =
              'not completed';
          break;
        }
        GlobalData.instance.progress.units![GlobalData.instance.unit].status =
            'completed';
      }

      // Mark Update flag for next time loading Map View:
      GlobalData.instance.needUpdate = true;
    }
  }
}
