import 'package:dio/dio.dart';
import 'package:viet_chronicle/models/question.dart';
import 'package:viet_chronicle/utils/constants.dart';

class QuestionController {
  final Dio _dio = Dio();
  List<Question> questions = [];
  bool isLoading = true;

  Future<void> fetchQuestions() async {
    final List<Question> result = [];
    try {
      final response = await _dio.get(BASE_URL + "/questions", 
        options: Options(
          headers: {
            "content-type": "application/json",
            "x-hasura-admin-secret": ADMIN_SECRET
            }
          )
        );
      final data = response.data["questions"];
      data.forEach((element) {
        result.add(Question.fromJson(element));
      });
      questions = result;
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }
}