import 'rule.dart';

class FixSchedule {
  static final List<Map<String, dynamic>> fixSchedule = [
    {
      'start': '2022-12-10T00:00:00Z',
      'end': '2022-12-12T00:00:00Z',
      'rule': Rule.bigRun.rawString
    },
    {
      'start': '2023-03-04T00:00:00Z',
      'end': '2023-03-06T00:00:00Z',
      'rule': Rule.bigRun.rawString
    },
    {
      'start': '2023-04-15T00:00:00Z',
      'end': '2023-04-17T00:00:00Z',
      'rule': Rule.teamContest.rawString
    },
  ];
}
