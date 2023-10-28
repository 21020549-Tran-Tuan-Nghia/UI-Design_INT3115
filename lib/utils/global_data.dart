import 'package:viet_chronicle/models/user.dart';

const ADMIN_SECRET = String.fromEnvironment('ADMIN_SECRET');

class GlobalData {
  GlobalData._();

  static final GlobalData instance = GlobalData._();

  factory GlobalData() {
    return instance;
  }

  late User user;
  String token = "";
  static String get BASE_URL => const String.fromEnvironment('BASE_URL');
  static String get KEYCLOAK_ENDPOINT => const String.fromEnvironment('KEYCLOAK_ENDPOINT');
}