import 'package:dio/dio.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class RegisterController {
  Dio _dio = Dio();

  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String repassword,
  }) async {
    if (username.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        repassword.isEmpty) {
      return false;
    }
    if (password != repassword) {
      return false;
    }
    try {
      final String baseURL = await GlobalData.storage.read(key: "base_url") as String;
      final String adminSecret = await GlobalData.storage.read(key: "admin_secret") as String;
      final response = await _dio.post(
          "$baseURL/insertusermutation",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": adminSecret
          }),
          queryParameters: {
            "username": username,
            "password": password,
            "email": email
          });
      print(response.data);
      if (response.data["InsertUserMutation"] == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
