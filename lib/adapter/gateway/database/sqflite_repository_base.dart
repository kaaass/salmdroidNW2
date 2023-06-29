import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqfliteRepositoryBase {
  static const String _dbFile = 'database.db';
  static const int _version = 4;
  static late Database _db;

  Future<String> _getDbPath() async {
    String path;
    if (Platform.isAndroid) {
      path = await getDatabasesPath();
    } else {
      throw Exception('getDbPath error');
    }
    return join(path, _dbFile);
  }

  Future<bool> isExist(String tableName) async {
    return true;
    // await _open();
    // var count = Sqflite.firstIntValue(await _db.query('sqlite_master',
    //     columns: ['COUNT(*)'],
    //     where: 'type = ? AND name = ?',
    //     whereArgs: ['table', tableName]));
    // return count == null ? false : count > 0;
  }

  Database getDB() {
    return _db;
  }

  Future<void> _open() async {
    final path = await _getDbPath();
    _db = await openDatabase(
      path,
      version: _version,
      onOpen: (db) {},
      onCreate: (db, version) {},
      onUpgrade: (db, oldVersion, newVersion) async {
        List<String> queries = [];
        for (String query in queries) {
          await db.execute(query);
        }
      },
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }

  Future<void> createTable(String sql) async {
    await _open();
    await _db.execute(sql);
  }

  Future<void> insert(String tableName, Map<String, dynamic> data) async {
    await _open();
    await _db.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(
    String tableName,
    Map<String, dynamic> data,
    String? where,
    List<Object?>? whereArgs,
  ) async {
    await _open();
    await _db.update(tableName, data,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> batch(String tableName, List<Map<String, dynamic>> datas) async {
    await _open();
    var batch = _db.batch();
    for (var data in datas) {
      batch.insert(tableName, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> query(String tableName) async {
    await _open();
    return await _db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String sql) async {
    await _open();
    return await _db.rawQuery(sql);
  }

  Future<void> execute(String sql) async {
    await _open();
    return await _db.execute(sql);
  }

  Future<void> createTableIfNeed();
}
