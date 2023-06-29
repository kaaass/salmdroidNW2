import '../salmonrun_data/rule.dart';
import 'player_info.dart';
import 'rate.dart';
import 'scale.dart';
import 'tide.dart';
import 'wave_info.dart';

class Stat {
  Rule rule = Rule.none;
  int jobNum = 0, maxGrade = 0;
  int clearNum = 0;
  String maxGradeId = '';
  double clearRate = 0, clearWave = 0;
  Scale scale = Scale();
  Tide okashira = Tide();
  String? okashiraId;
  PlayerInfo maxIkuraOnlyDay = PlayerInfo(), maxIkuraIncNight = PlayerInfo();
  PlayerInfo teamMaxIkuraDay = PlayerInfo(), teamMaxIkuraNight = PlayerInfo();
  PlayerInfo avgIkuras = PlayerInfo(),
      maxIkuras = PlayerInfo(),
      totalIkuras = PlayerInfo();
  PlayerInfo teamAvgIkuras = PlayerInfo(),
      teamMaxIkuras = PlayerInfo(),
      teamTotalIkuras = PlayerInfo();
  int teamMemberNum = 0;
  Map<String, int> weapons = {},
      specials = {},
      salmonidsMyDef = {},
      salmonidsPop = {};
  Map<String, Tide> eventRate = {};

  Map<String, Rate> weaponRate = {}, specialRate = {};

  // for eggstra work
  List<WaveInfo> eggstraWaveInfo = [];
  List<WaveInfo> eggstraMaxEggsWaveInfo = [];
  int eggstraMaxEggs = 0;
  int eggstraMaxPowerEggs = 0;
}
