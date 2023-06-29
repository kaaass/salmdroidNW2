import 'win_lose.dart';

class Tide {
  Map<String, WinLose> t = {
    '0': WinLose(),
    '1': WinLose(),
    '2': WinLose(),
  };

  Tide operator +(Tide other) {
    Tide ret = this;
    ret.t['0'] = ret.t['0']! + other.t['0']!;
    ret.t['1'] = ret.t['1']! + other.t['1']!;
    ret.t['2'] = ret.t['2']! + other.t['2']!;
    return ret;
  }

  @override
  String toString() {
    return 'high:${t['2']} normal:${t['1']} low:${t['0']}';
  }
}
