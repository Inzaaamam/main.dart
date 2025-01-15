import 'package:auth_app/app/sdk/db/app_database.dart';
import 'package:auth_app/app/sdk/db/user/table.dart';
import 'package:sqflite/sqflite.dart';

class DaoUser {
  static final DaoUser _daoUser = DaoUser._internal();
  DaoUser._internal();
  static get get => _daoUser;

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await AppDatabase.get.dB;
    return db.insert(UserTable.userTable, data,
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> insertList(List<Map<String, dynamic>> dataList) async {
    if (dataList.isEmpty) return;
    final db = await AppDatabase.get.dB;
    final batch = db.batch();
    for (final item in dataList) {
      batch.insert(
        UserTable.userTable,
        item,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<UserTable>> getUser() async {
    try {
      final db = await AppDatabase.get.dB;
      final response = await db.query(UserTable.userTable);
      return response.map((e) => UserTable.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deteteTable() async {
    try {
      final db = await AppDatabase.get.dB;
      await db.delete(UserTable.userTable);
    } catch (e) {
      rethrow;
    }
  }
}
