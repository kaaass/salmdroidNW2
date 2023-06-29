class ShiftDetail {
  late String start;
  late String end;
  late String stage;
  late List<String> weapons;
  late int num;

  ShiftDetail() {
    start = "";
    end = "";
    stage = "";
    weapons = [];
    num = 0;
  }

  ShiftDetail.fromInfo(
      String start, String end, String stage, List<String> weapons) {
    start = start;
    end = end;
    stage = stage;
    weapons = weapons;
    num = 0;
  }
}
