import 'package:isar/isar.dart';

import '../../../application/interface/i_shift_repository.dart';
import '../../../domain/shift/shift.dart';
import 'repository_base.dart';

class ShiftRepository extends IShiftRepository {
  late final RepositoryBase _base;

  ShiftRepository() {
    _base = RepositoryBase();
  }

  Future<IsarCollection<Shift>> getCategory() async {
    Isar isar = await _base.getIsar();
    return isar.shifts;
  }

  @override
  Future<void> drop() async {
    await _base.clear(await getCategory());
  }

  @override
  Future<void> insert(Shift data) async {
    await insertAll([data]);
  }

  @override
  Future<void> insertAll(List<Shift> datas) async {
    await _base.put(await getCategory(), datas);
  }

  @override
  Future<List<Shift>> getShifts() async {
    final IsarCollection<Shift> collection = await getCategory();
    return await collection.where().findAll();
  }

  @override
  Future<Shift?> getShift(String start) async {
    final IsarCollection<Shift> collection = await getCategory();
    final List<Shift> ret =
        await collection.filter().startGreaterThan(start).findAll();
    return ret.isNotEmpty ? ret.first : null;
  }
}
