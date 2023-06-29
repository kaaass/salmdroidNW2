enum Type {
  none,
  finishGetResult,
  doingCalcForAllData,
  finishCalcForAllData,
}

class DataState {
  Type type = Type.none;
  int now = 0;
  int max = 0;

  DataState();
  DataState.set({required this.type, required this.now, required this.max});
}
