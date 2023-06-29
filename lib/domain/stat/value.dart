import 'dart:math';

class Value {
  double v = 0;

  void setIfOver(double other) {
    v = max(v, other);
  }
}
