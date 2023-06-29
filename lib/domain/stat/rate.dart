import 'dart:convert';

class Rate {
  Rate({required this.name, required this.rate, required this.num});
  String name = '';
  double rate = 0;
  int num = 0;

  Rate.map(Map<String, dynamic> map) {
    name = map['name'];
    rate = double.parse(map['rate'].toString());
    num = map['num'];
  }

  Rate.local(String data) {
    var map = json.decode(data);
//    Log.i(map.toString());
    name = map['name'];
    rate = double.parse(map['rate'].toString());
    num = map['num'];
  }

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "rate": rate,
      "num": num,
    };
  }
}
