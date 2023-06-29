enum Rule {
  none(0x00, 'none'),
  regular(0x01 << 0, 'REGULAR'),
  bigRun(0x01 << 1, 'BIG_RUN'),
  teamContest(0x01 << 2, 'TEAM_CONTEST');

  final int rawValue;
  final String rawString;
  const Rule(this.rawValue, this.rawString);
  factory Rule.from({required int rawValue, required String rawString}) {
    final value = Rule.values.firstWhere((e) {
      return (e.rawValue == rawValue) && (e.rawString == rawString);
    });
    return value;
  }
}
