class Question {
  final String? question;
  Map<String, bool>? answers;

  Question({this.question, this.answers});

  static Question fromJson(Map<dynamic, dynamic> json) {
    final question = json["question_text"];
    Map<String, bool> answers = {};
    for (var answer in json["answers"]) {
      answers[answer["answer_text"]] = answer["is_correct"];
    }
    return Question(question: question, answers: answers);
  }
}