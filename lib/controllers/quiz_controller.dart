import 'package:dio/dio.dart';
import 'package:viet_chronicle/models/quiz.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class QuizController {
  final Dio _dio = Dio();
  List<Quiz> questions = [];
  bool isLoading = true;

  Future<void> fetchQuestions() async {
    final List<Quiz> result = [];
    try {
      final String baseURL =
          await GlobalData.storage.read(key: "base_url") as String;
      final String adminSecret =
          await GlobalData.storage.read(key: "admin_secret") as String;
      final response = await _dio.get("$baseURL/getquestions",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": adminSecret
          }),
          queryParameters: {"id": 86});
      final data = response.data["questions"];
      data.forEach((element) {
        result.add(Quiz.fromJson(element));
      });
      questions = result;
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }
}
