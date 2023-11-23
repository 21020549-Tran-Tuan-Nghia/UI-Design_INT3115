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
      final response = await _dio.get("${GlobalData.BASE_URL}/questions",
          options: Options(headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": ADMIN_SECRET
          }));
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
