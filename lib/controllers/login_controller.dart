import 'package:dio/dio.dart';
import 'package:viet_chronicle/models/progress.dart';
import 'package:viet_chronicle/models/user.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class LoginController {
  final Dio _dio = Dio();

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return false;
    }
    try {
      final String keycloakEndpoint =
          await GlobalData.storage.read(key: "keycloak_endpoint") as String;
      final response = await _dio.post(keycloakEndpoint,
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          ),
          data: {
            'username': username,
            'password': password,
            'grant_type': 'password',
            'client_id': 'hasura',
          });
      print(response.data);
      GlobalData.instance.saveSession("token", response.data["access_token"]);
      return getUserData();
    } catch (e) {
      print(e);
      return false;
    }
  }

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
        }
      );
      GlobalData.instance.progress = Progress.fromJson(programResponse.data["getProgress"]);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
