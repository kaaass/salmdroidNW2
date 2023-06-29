import 'dart:convert';

class Summary {
  final HistoryGroupsOnlyFirst historyGroupsOnlyFirst;
  final PointCard card;
  final String historyGroups;

  const Summary(
      {required this.historyGroupsOnlyFirst,
      required this.card,
      required this.historyGroups});

  factory Summary.fromJson(Map<String, dynamic> j) {
    return Summary(
      historyGroupsOnlyFirst:
          HistoryGroupsOnlyFirst.fromJson(j['historyGroupsOnlyFirst']),
      card: PointCard.fromJson(j['pointCard']),
      historyGroups: json.encode(j['historyGroups']),
    );
  }
}

class HistoryGroupsOnlyFirst {
  final String id;

  const HistoryGroupsOnlyFirst({required this.id});

  factory HistoryGroupsOnlyFirst.fromJson(Map<String, dynamic> j) {
    return HistoryGroupsOnlyFirst(
        id: j['nodes'][0]['historyDetails']['nodes'][0]['id']);
  }
}

class PointCard {
  final int goldenDeliverCount;
  final int deliverCount;
  final int rescueCount;
  final int playCount;
  final int regularPoint;
  final int totalPoint;
  final int defeatBossCount;

  const PointCard({
    required this.goldenDeliverCount,
    required this.deliverCount,
    required this.rescueCount,
    required this.playCount,
    required this.regularPoint,
    required this.totalPoint,
    required this.defeatBossCount,
  });

  factory PointCard.fromJson(Map<String, dynamic> json) {
    return PointCard(
      goldenDeliverCount: json['goldenDeliverCount'] as int,
      deliverCount: json['deliverCount'] as int,
      rescueCount: json['rescueCount'] as int,
      playCount: json["playCount"] as int,
      regularPoint: json['regularPoint'] as int,
      totalPoint: json['totalPoint'] as int,
      defeatBossCount: json['defeatBossCount'] as int,
    );
  }
}
