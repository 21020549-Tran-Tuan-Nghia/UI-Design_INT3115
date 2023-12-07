import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  static final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  static final GlobalData instance = GlobalData._();
  late User user;
  late Progress progress;
  late int unit = -1;

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
}
