enum Language {
  japanese(0),
  english(1),
  zh(2),
  zhtw(3);

  final int rawValue;
  const Language(this.rawValue);
  factory Language.from({required int rawValue}) {
    final value = Language.values.firstWhere((e) => e.rawValue == rawValue);
    return value;
  }
}
