// import 'package:isar/isar.dart';

// import '../../../application/interface/i_shift_repository.dart';
// import '../../../domain/salmonrun_data/common.dart';
// import '../../../domain/shift/shift.dart';
// import '../database/repository_base.dart';

// class ShiftRepositoryInMemory extends IShiftRepository {
//   List<Map<String, dynamic>> _inMemory = [];
//   late final RepositoryBase _base;

//   ShiftRepositoryInMemory() {
//     _base = RepositoryBase();

//     _inMemory = [];

//     // add debug data
//     Map<String, dynamic> data = {};
//     data['start'] = '2023-01-01T00:00:00Z';
//     data['end'] = '2023-01-02T00:00:00Z';
//     data['stageId'] = 'Q29vcFN0YWdlLTE=';
//     data['weapon1'] = Common.randomWeapon;
//     data['weapon2'] = Common.goldenRandomWeapon;
//     data['weapon3'] =
//         '6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png';
//     data['weapon4'] =
//         '6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65_0.png';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTA=';
//     data['maxGradePoint'] = 40;
//     data['played'] = 9999;
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTI=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTE=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTc=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTI=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTY=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTM=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTEwMA==';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTQ=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTc=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTU=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTY=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTY=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTI=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTc=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTEwMA==';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTg=';
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTY=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTg=';
//     data['maxGradePoint'] = 240;
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTc=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTg=';
//     data['maxGradePoint'] = 440;
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTEwMA==';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTg=';
//     data['maxGradePoint'] = 640;
//     _set(data);

//     data['stageId'] = 'Q29vcFN0YWdlLTE=';
//     data['maxGradeId'] = 'Q29vcEdyYWRlLTg=';
//     data['maxGradePoint'] = 999;
//     _set(data);
//   }

//   void _set(Map<String, dynamic> data) {
//     Map<String, dynamic> newMap = {};
//     newMap['start'] = data['start'];
//     newMap['end'] = data['end'];
//     newMap['stageId'] = data['stageId'];
//     newMap['weapon1'] = data['weapon1'];
//     newMap['weapon2'] = data['weapon2'];
//     newMap['weapon3'] = data['weapon3'];
//     newMap['weapon4'] = data['weapon4'];
//     newMap['maxGradeId'] = data['maxGradeId'];
//     newMap['maxGradePoint'] = data['maxGradePoint'];
//     newMap['played'] = data['played'];
//     _inMemory.add(newMap);
//   }

//   IsarCollection<Shift> getCategory() {
//     Isar isar = _base.getIsar();
//     return isar.shifts;
//   }

//   @override
//   Future<void> drop() async {}

//   @override
//   Future<void> insert(Shift data) async {}

//   @override
//   Future<void> insertAll(List<Shift> datas) async {}

//   @override
//   Future<List<Shift>> getShifts() async {
//     return [];
//   }

//   @override
//   Future<Shift?> getShift(String start) async {
//     return null;
//   }
// }
