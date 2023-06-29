import 'shift_detail.dart';
import 'stage_detail.dart';

class ShiftStat {
  // シフト情報
  late int jobnum;
  late int privateNum;
  late List<ShiftDetail> details;

  // ステージ情報
  late List<StageDetail> stages;

  ShiftStat() {
    jobnum = 0;
    privateNum = 0;
    details = [];
    stages = [];
  }
}
