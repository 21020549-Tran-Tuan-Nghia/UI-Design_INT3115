
import 'package:dio/dio.dart';
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
      final response = await _dio.post(GlobalData.KEYCLOAK_ENDPOINT, 
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
        }
        );
      GlobalData.instance.token = response.data["access_token"];
      final userResponse = await _dio.get("${GlobalData.BASE_URL}/user", 
        options: Options(
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer ${GlobalData.instance.token}"
            }
          )
        );
      GlobalData.instance.user = User.fromJson(userResponse.data);
      if (GlobalData.instance.token != "" ) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}