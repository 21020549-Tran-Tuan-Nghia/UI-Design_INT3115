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
      final response = await _dio.post("${GlobalData.BASE_URL}/login",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": GlobalData.ADMIN_SECRET
          }),
          queryParameters: {"username": username, "password": password});
      
      GlobalData.instance.token = response.data["getUser"]["access_token"];
      GlobalData.instance.user = User.fromJson(response.data["getUser"]["user"]);
      if (GlobalData.instance.token != "") {
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
