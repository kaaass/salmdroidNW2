import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:salmdroidnw2/domain/coop_history_detail/coop_history_detail.dart';

class CoopHistoryDetailConverter {
  static CoopHistoryDetail createEmptyCoopHistoryDetail() {
    Image url = Image()..url = '';
    TextColor textColor = TextColor()
      ..a = 0
      ..b = 0
      ..g = 0
      ..r = 0;
    Background background = Background()
      ..textColor = textColor
      ..image = url
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

  static CoopHistoryDetail createCoopHistoryDetailFromMap(
      Map<String, dynamic> org) {
    return createCoopHistoryDetailFromMap2(jsonDecode(org['coopHistory']));
  }

  static CoopHistoryDetail createCoopHistoryDetailFromMap2(
      Map<String, dynamic> org) {
    List<PlayerResult> memberResult = [];
    for (var v in org['memberResults']) {
      memberResult.add(_createPlayerResult(v));
    }
    List<EnemyResult> enemyResults = [];
    for (var v in org['enemyResults']) {
      enemyResults.add(_createEnemyResult(v));
    }
    List<WaveResult> waveResults = [];
    for (var v in org['waveResults']) {
      waveResults.add(_createWaveResult(v));
    }
    return CoopHistoryDetail()
      ..historyId = org['id']
      ..afterGrade = _createAfterGrade(org['afterGrade'])
      ..rule = org['rule']
      ..myResult = _createPlayerResult(org['myResult'])
      ..memberResults = memberResult
      ..bossResult = _createBossResult(org['bossResult'])
      ..enemyResults = enemyResults
      ..waveResults = waveResults
      ..resultWave = org['resultWave']
      ..playedTime = org['playedTime']
      ..coopStage = _createCoopStage(org['coopStage'])
      ..dangerRate = double.parse(org['dangerRate'].toString())
      ..scenarioCode = org['senarioCode']
      ..smellMeter = org['smellMeter']
      ..weapons = []
      ..afterGradePoint = org['afterGradePoint']
      ..scale = _createScale(org['scale'])
      ..jobPoint = org['jobPoint']
      ..jobScore = org['jobScore']
      ..jobRate = org['jobRate'] == null
          ? null
          : double.parse(org['jobRate'].toString())
      ..jobBonus = org['jobBonus']
      ..nextHistoryDetail = _createHistoryDetail(org['nextHistoryDetail'])
      ..prevHistoryDetail = _createHistoryDetail(org['previousHistoryDetail']);
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
      ..specialWeapon = org['specialWeapon'] == null
          ? null
          : _createSpecialWeapon(org['specialWeapon'])
      ..defeatEnemyCount = org['defeatEnemyCount']
      ..deliverCount = org['deliverCount']
      ..goldenAssistCount = org['goldenAssistCount']
      ..goldenDeliverCount = org['goldenDeliverCount']
      ..rescueCount = org['rescueCount']
      ..rescuedCount = org['rescuedCount'];
  }

  static Player _createPlayer(Map<String, dynamic> org) {
    return Player()
      ..isplayer = org['__isPlayer']
      ..byname = org['byname']
      ..name = org['name']
      ..nameId = org['nameId']
      ..nameplate = _createNameplate(org['nameplate'])
      ..uniform = _createUniform(org['uniform'])
      ..id = org['id']
      ..species = org['species'];
  }

  static Nameplate _createNameplate(Map<String, dynamic> org) {
    List<Badge?> badges = [];
    for (var v in org['badges']) {
      badges.add(_createBadge(v));
    }

    return Nameplate()
      ..badges = badges
      ..background = _createBackground(org['background']);
  }

  static Uniform _createUniform(Map<String, dynamic> org) {
    return Uniform()
      ..name = org['name']
      ..id = org['id']
      ..image = _createImage(org['image']);
  }

  static Badge? _createBadge(Map<String, dynamic>? org) {
    return org == null
        ? null
        : (Badge()
          ..id = org['id']
          ..image = _createImage(org['image']));
  }

  static Background _createBackground(Map<String, dynamic> org) {
    return Background()
      ..textColor = _createTextColor(org['textColor'])
      ..image = _createImage(org['image'])
      ..id = org['id'];
  }

  static TextColor _createTextColor(Map<String, dynamic> org) {
    return TextColor()
      ..a = org['a']
      ..b = org['b']
      ..g = org['g']
      ..r = org['r'];
  }

  static Image _createImage(Map<String, dynamic> org) {
    File file = File(org['url']);
    return Image()..url = path.basename(file.path.split('?')[0]);
  }

  static BossResult? _createBossResult(Map<String, dynamic>? org) {
    return org == null
        ? null
        : (BossResult()
          ..hasDefeatBoss = org['hasDefeatBoss']
          ..boss = _createBoss(org['boss']));
  }

  static Boss _createBoss(Map<String, dynamic> org) {
    return Boss()
      ..id = org['id']
      ..name = org['name']
      ..image = _createImage(org['image']);
  }

  static EnemyResult _createEnemyResult(Map<String, dynamic> org) {
    return EnemyResult()
      ..defeatCount = org['defeatCount']
      ..teamDefeatCount = org['teamDefeatCount']
      ..popCount = org['popCount']
      ..enemy = _createBoss(org['enemy']);
  }

  static WaveResult _createWaveResult(Map<String, dynamic> org) {
    List<SpecialWeapon> specialWeapons = [];
    for (var v in org['specialWeapons']) {
      if (v != null) {
        specialWeapons.add(_createSpecialWeapon(v));
      }
    }

    return WaveResult()
      ..waveNumber = org['waveNumber']
      ..waterLevel = org['waterLevel']
      ..eventWave = _createEventWave(org['eventWave'])
      ..deliverNorm = org['deliverNorm']
      ..goldenPopCount = org['goldenPopCount']
      ..teamDeliverCount = org['teamDeliverCount']
      ..specialWeapons = specialWeapons;
  }

  static EventWave? _createEventWave(Map<String, dynamic>? org) {
    return org == null
        ? null
        : (EventWave()
          ..id = org['id']
          ..name = org['name']);
  }

  static CoopStage _createCoopStage(Map<String, dynamic> org) {
    return CoopStage()
      ..id = org['id']
      ..name = org['name']
      ..image = _createImage(org['image']);
  }

  static Weapon _createWeapon(Map<String, dynamic> org) {
    return Weapon()
      ..name = org['name']
      ..image = _createImage(org['image']);
  }

  static SpecialWeapon _createSpecialWeapon(Map<String, dynamic> org) {
    return SpecialWeapon()
      ..name = org['name']
      ..image = _createImage(org['image'])
      ..id = org['id'];
  }

  static Scale? _createScale(Map<String, dynamic>? org) {
    return org == null
        ? null
        : (Scale()
          ..gold = org['gold']
          ..silver = org['silver']
          ..bronze = org['bronze']);
  }

  static HistoryDetail? _createHistoryDetail(Map<String, dynamic>? org) {
    return org == null ? null : (HistoryDetail()..id = org['id']);
  }
}
