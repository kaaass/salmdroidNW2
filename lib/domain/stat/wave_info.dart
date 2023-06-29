class WaveInfo {
  int num = 0;
  int norm = 0;
  int maxEggs = 0;
  int maxAppearEggs = 0;
  int totalEggs = 0;
  int totalAppearEggs = 0;

  late int waveNum;
  late String eventId;
  late int tide;
  List<String> sp = [];

  WaveInfo({required this.waveNum, required this.eventId, required this.tide});
}
