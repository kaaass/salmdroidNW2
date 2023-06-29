class Util {
  static String getMatchString(String target, var pattern) {
    RegExp exp = RegExp(pattern);
    var matches = exp.allMatches(target);
    var m = matches.first;
    return m.group(1).toString();
  }
}
