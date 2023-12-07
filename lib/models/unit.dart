import 'package:viet_chronicle/models/subunit.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class Unit {
  final int? id;
  final String? title;
  String status = notCompleted;
  List<SubUnit> subunits = [];
  
  Unit({this.id, this.title, required this.subunits, this.status = notCompleted});

  static Unit fromJson(Map<dynamic, dynamic> json) {
    print(json);
    List<SubUnit> subunits = [];
    for (var subunit in json["subunits"]) {
      subunits.add(SubUnit.fromJson(subunit));
    }
    return Unit(
      id: json["id"],
      title: json["title"],
      subunits: subunits,
      status: json["status"],
    );
  }
}