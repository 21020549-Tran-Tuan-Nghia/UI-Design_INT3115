import 'package:viet_chronicle/utils/global_data.dart';

class Lesson {
  final int? id;
  final String? lessonType;
  String status = notCompleted;
  
  Lesson({this.id, this.lessonType, this.status = notCompleted});

  static Lesson fromJson(Map<dynamic, dynamic> json) {
    return Lesson(
      id: json["id"],
      lessonType: json["lesson_type"],
      status: json["status"],
    );
  }
}
