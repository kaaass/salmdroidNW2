import 'package:isar/isar.dart';

part 'coop_history_detail.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@Collection()
class CoopHistoryDetail {
  Id id = Isar.autoIncrement;

  late String historyId;
  late AfterGrade? afterGrade;
  late String rule;
  late PlayerResult myResult;
  late List<PlayerResult> memberResults;
  late BossResult? bossResult;
  late List<EnemyResult> enemyResults;
  late List<WaveResult> waveResults;
  late int resultWave;
  @Index()
  late String playedTime;
  late CoopStage coopStage;
  late double dangerRate;
  late String? scenarioCode;
  late int? smellMeter;
  late List<Weapon> weapons;
  late int? afterGradePoint;
  late Scale? scale;
  late int? jobPoint;
  late int? jobScore;
  late double? jobRate;
  late int? jobBonus;
  late HistoryDetail? nextHistoryDetail;
  late HistoryDetail? prevHistoryDetail;
}

@embedded
class AfterGrade {
  late String name;
  late String id;
}

@embedded
class PlayerResult {
  late Player player;
  late List<Weapon> weapons;
  late SpecialWeapon? specialWeapon;
  late int defeatEnemyCount;
  late int deliverCount;
  late int goldenAssistCount;
  late int goldenDeliverCount;
  late int rescueCount;
  late int rescuedCount;
}

@embedded
class Player {
  late String isplayer;
  late String byname;
  late String name;
  late String nameId;
  late Nameplate nameplate;
  late Uniform uniform;
  late String id;
  late String species;
}

@embedded
class Nameplate {
  late List<Badge?> badges;
  late Background background;
}

@embedded
class Background {
  late TextColor textColor;
  late Image image;
  late String id;
}

@embedded
class TextColor {
  late double a;
  late double b;
  late double g;
  late double r;
}

@embedded
class Image {
  late String url;
}

@embedded
class Badge {
  late String id;
  late Image image;
}

@embedded
class Uniform {
  late String name;
  late Image image;
  late String id;
}

@embedded
class Weapon {
  late String name;
  late Image image;
}

@embedded
class SpecialWeapon {
  late String name;
  late String id;
  late Image image;
}

@embedded
class BossResult {
  late bool hasDefeatBoss;
  late Boss boss;
}

@embedded
class Boss {
  late String name;
  late String id;
  late Image image;
}

@embedded
class EnemyResult {
  late int defeatCount;
  late int teamDefeatCount;
  late int popCount;
  late Boss enemy;
}

@embedded
class WaveResult {
  late int waveNumber;
  late int waterLevel;
  late EventWave? eventWave;
  late int? deliverNorm;
  late int goldenPopCount;
  late int? teamDeliverCount;
  late List<SpecialWeapon> specialWeapons;
}

@embedded
class EventWave {
  late String name;
  late String id;
}

@embedded
class CoopStage {
  late String name;
  late Image image;
  late String id;
}

@embedded
class Scale {
  late int gold;
  late int silver;
  late int bronze;
}

@embedded
class HistoryDetail {
  late String id;
}
