import 'package:salmdroidnw2/domain/coop_history_detail/coop_history_detail.dart';
import 'package:salmdroidnw2/domain/defeat/defeat.dart';
import 'package:salmdroidnw2/domain/king_defeat/king_defeat.dart';
import 'package:salmdroidnw2/domain/shift/shift.dart';

class DataConverter {
  static CoopHistoryDetail toCoopHistoryDetail(Map<String, dynamic> org) {
    Url url = Url()..url = '';
    TextColor textColor = TextColor()
      ..a = 0
      ..b = 0
      ..g = 0
      ..r = 0;
    Background background = Background()
      ..textColor = textColor
      ..url = url
      ..id = '';
    Nameplate nameplate = Nameplate()
      ..badges = []
      ..background = background;
    Uniform uniform = Uniform()
      ..id = ''
      ..image = url
      ..name = '';
    Player p = Player()
      ..isplayer = ''
      ..byname = ''
      ..name = ''
      ..nameId = ''
      ..nameplate = nameplate
      ..uniform = uniform
      ..id = ''
      ..species = '';
    PlayerResult myResult = PlayerResult()
      ..player = p
      ..weapons = []
      ..specialWeapon = null
      ..defeatEnemyCount = 0
      ..deliverCount = 0
      ..goldenAssistCount = 0
      ..goldenDeliverCount = 0
      ..rescueCount = 0
      ..rescuedCount = 0;
    CoopStage coopStage = CoopStage()
      ..id = ''
      ..image = url
      ..name = '';

    return CoopHistoryDetail()
      ..historyId = ''
      ..afterGrade = null
      ..rule = ''
      ..myResult = myResult
      ..memberResults = []
      ..bossResult = null
      ..enemyResults = []
      ..waveResults = []
      ..resultWave = 0
      ..playedTime = ''
      ..coopStage = coopStage
      ..dangerRate = 0
      ..scenarioCode = null
      ..smellMeter = null
      ..weapons = []
      ..afterGradePoint = null
      ..scale = null
      ..jobPoint = null
      ..jobScore = null
      ..jobRate = null
      ..jobBonus = null
      ..nextHistoryDetail = null
      ..prevHistoryDetail = null;
  }

  static Shift toShift(Map<String, dynamic> org) {
    return Shift()
      ..start = ''
      ..end = ''
      ..stageId = ''
      ..weapons = []
      ..maxGradeId = ''
      ..maxGradePoint = 0
      ..maxEggs = 0
      ..played = 0
      ..rule = ''
      ..kingSalmonids = '';
  }

  static Defeat toDefeat(Map<String, dynamic>? org) {
    if (org == null) {
      return Defeat()
        ..num = 0
        ..latestId = ''
        ..coopEnemy4 = 0
        ..coopEnemy5 = 0
        ..coopEnemy6 = 0
        ..coopEnemy7 = 0
        ..coopEnemy8 = 0
        ..coopEnemy9 = 0
        ..coopEnemy10 = 0
        ..coopEnemy11 = 0
        ..coopEnemy12 = 0
        ..coopEnemy13 = 0
        ..coopEnemy14 = 0;
    } else {
      return Defeat();
    }
  }

  static KingDefeat toKingDefeat(Map<String, dynamic>? org) {
    if (org == null) {
      return KingDefeat()
        ..num = 0
        ..latestId = ''
        ..coopEnemy23 = 0
        ..coopEnemy24 = 0;
    } else {
      return KingDefeat();
    }
  }

  static CoopHistoryDetail _createFromMap(Map<String, dynamic> org) {
    Url url = Url()..url = '';
    TextColor textColor = TextColor()
      ..a = 0
      ..b = 0
      ..g = 0
      ..r = 0;
    Background background = Background()
      ..textColor = textColor
      ..url = url
      ..id = '';
    Nameplate nameplate = Nameplate()
      ..badges = []
      ..background = background;
    Uniform uniform = Uniform()
      ..id = ''
      ..image = url
      ..name = '';
    Player p = Player()
      ..isplayer = ''
      ..byname = ''
      ..name = ''
      ..nameId = ''
      ..nameplate = nameplate
      ..uniform = uniform
      ..id = ''
      ..species = '';
    PlayerResult myResult = PlayerResult()
      ..player = p
      ..weapons = []
      ..specialWeapon = null
      ..defeatEnemyCount = 0
      ..deliverCount = 0
      ..goldenAssistCount = 0
      ..goldenDeliverCount = 0
      ..rescueCount = 0
      ..rescuedCount = 0;
    CoopStage coopStage = CoopStage()
      ..id = ''
      ..image = url
      ..name = '';

    return CoopHistoryDetail()
      ..historyId = org['id']
      ..afterGrade = _createAfterGrade(org['afterGrade'])
      ..rule = org['rule']
      ..myResult = myResult
      ..memberResults = []
      ..bossResult = null
      ..enemyResults = []
      ..waveResults = []
      ..resultWave = org['resultWave']
      ..playedTime = org['playedTime']
      ..coopStage = coopStage
      ..dangerRate = double.parse(org['dangerRate'].toString())
      ..scenarioCode = org['senarioCode']
      ..smellMeter = org['smellMeter']
      ..weapons = []
      ..afterGradePoint = org['afterGradePoint']
      ..scale = null
      ..jobPoint = org['jobPoint']
      ..jobScore = org['jobScore']
      ..jobRate = org['jobRate'] == null
          ? null
          : double.parse(org['jobRate'].toString())
      ..jobBonus = org['jobBonus']
      ..nextHistoryDetail = null
      ..prevHistoryDetail = null;
  }

  static AfterGrade? _createAfterGrade(Map<String, dynamic>? org) {
    if (org == null) {
      return null;
    }
    return AfterGrade()
      ..id = org['id']
      ..name = org['name'];
  }

  static PlayerResult _createPlayerResult(Map<String, dynamic> org) {
    List<Weapon> weapons = [];
    for (var v in org['weapons']) {
      weapons.add(_createWeapon(v));
    }
    return PlayerResult()
      ..player = _createPlayer(org['player'])
      ..weapons = weapons
      ..specialWeapon = _createSpecialWeapon(org['specialWeapon'])
      ..defeatEnemyCount = org['defeatEnemyCount']
      ..deliverCount = org['deliverCount']
      ..goldenAssistCount = org['goldenAssistCount']
      ..goldenDeliverCount = org['goldenDeliverCount']
      ..rescueCount = org['rescueCount']
      ..rescuedCount = org['rescuedCount'];
  }

  static Player _createPlayer(Map<String, dynamic> org) {}

  static Nameplate _createNameplate(Map<String, dynamic> org) {}

  static Uniform _createUniform(Map<String, dynamic> org) {}

  static Badge _createBadge(Map<String, dynamic> org) {}

  static Background _createBackground(Map<String, dynamic> org) {}

  static TextColor _createTextColor(Map<String, dynamic> org) {}

  static Uniform _createUniform(Map<String, dynamic> org) {}

  static Url _createUrl(Map<String, dynamic> org) {}

  static BossResult _createBossResult(Map<String, dynamic>? org) {}

  static Boss _createBoss(Map<String, dynamic> org) {}

  static EnemyResult _createEnemyResult(Map<String, dynamic> org) {}

  static WaveResult _createWaveResult(Map<String, dynamic> org) {}

  static EventWave _createEventWave(Map<String, dynamic> org) {}

  static CoopStage _createCoopStage(Map<String, dynamic> org) {}

  static Weapon _createWeapon(Map<String, dynamic> org) {}

  static SpecialWeapon? _createSpecialWeapon(Map<String, dynamic> org) {
    return null;
  }

  static EnemyResult _createEnemyResult(Map<String, dynamic> org) {}

  static Scale _createScale(Map<String, dynamic> org) {}

  static HistoryDetail _createHistoryDetail(Map<String, dynamic> org) {}
}
