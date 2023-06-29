import 'package:isar/isar.dart';

part 'shift.g.dart';

@Collection()
class Shift {
  Id id = Isar.autoIncrement;

  @Index()
  late String start;
  late String end;
  late String stageId;
  late List<String> weapons;
  late String maxGradeId;
  late int maxGradePoint;
  late int maxEggs;
  late int played;
  late String rule;
  late String kingSalmonids;
}
