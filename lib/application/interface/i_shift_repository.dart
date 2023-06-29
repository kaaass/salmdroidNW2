import '../../domain/shift/shift.dart';

abstract class IShiftRepository {
  Future<void> drop();
  Future<void> insert(Shift data);
  Future<void> insertAll(List<Shift> datas);
  Future<List<Shift>> getShifts();
  Future<Shift?> getShift(String start);
}
