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
      final response = await _dio.post(
          "${GlobalData.BASE_URL}/insertusermutation",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": GlobalData.ADMIN_SECRET
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
