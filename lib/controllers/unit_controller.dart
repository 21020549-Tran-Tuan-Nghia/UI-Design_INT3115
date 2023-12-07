import 'package:viet_chronicle/models/unit.dart';
import 'package:viet_chronicle/utils/global_data.dart';

class UnitController {
  int renderUnitId = -1;

  UnitController();

  init() async {
    if (GlobalData.instance.progress.units != null) {
    } else {
      //TODO: GetUserData()
    }

    renderUnitId = GlobalData.instance.unit;
  }

  Unit getUnit(int unitId) {
    return GlobalData.instance.progress.units![unitId];
  }

  int getNumberOfUnit() {
    return GlobalData.instance.progress.units!.length;
  }

  void setUnitId(int newUnitId) {
    GlobalData.instance.unit = newUnitId;
  }

  void changeRenderUnitId(int newUnitId) {
    renderUnitId = newUnitId;
  }

  int getUnitId() {
    return renderUnitId;
  }

  int getCurrentNumberSubunit(int unitId) {
    int cnt = 0;
    for (var subUnit in GlobalData.instance.progress.units![unitId].subunits) {
      if (subUnit.status == "completed") {
        cnt++;
      }
    }
    return cnt;
  }
}
