import 'package:viet_chronicle/models/unit.dart';

class Progress {
  List<Unit>? units = [];
  Progress({this.units});  
  static Progress fromJson(Map<dynamic, dynamic> json) {
    List<Unit> units = [];
    for (var unit in json["units"]) {
      units.add(Unit.fromJson(unit));
    }
    return Progress(units: units);
  }
}