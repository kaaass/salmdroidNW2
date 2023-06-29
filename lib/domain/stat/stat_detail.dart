import 'points.dart';
import 'stage.dart';

class StatDetail {
  double minHazard = 333;

  Map<String, Stage> stages = {};
  int regular = 0;
  int private = 0;

  Points success = Points();
  Points failure = Points();

  int maxEggs = 0;
  int maxDefeats = 0;

  Map<String, double> delivers = {};
  Map<String, double> defeats = {};
  Map<String, double> failureDelivers = {};
  Map<String, double> failureDefeats = {};

  Map<String, double> clearRate = {};
}
