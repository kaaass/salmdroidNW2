import 'value.dart';

class PlayerInfo {
  Value goldenikura = Value();
  Value ikura = Value();
  Value rescue = Value();
  Value rescued = Value();
  Value defeat = Value();

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    return {
      "goldenikura": goldenikura.v,
      "ikura": ikura.v,
      "rescue": rescue.v,
      "rescued": rescued.v,
      "defeat": defeat.v,
    };
  }
}
