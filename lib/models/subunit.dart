import 'package:viet_chronicle/models/lesson.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class SubUnit {
  final int? id;
  final String? title;
  String status = notCompleted;
  List<Lesson> lessons = [];
  
  SubUnit({this.id, this.title, required this.lessons, this.status = notCompleted});

  static SubUnit fromJson(Map<dynamic, dynamic> json) {
    List<Lesson> lessons = [];
    for (var lesson in json["lessons"]) {
      lessons.add(Lesson.fromJson(lesson));
    }
    return SubUnit(
      id: json["id"],
      title: json["title"],
      lessons: lessons,
      status: json["status"],
    );
  }
}