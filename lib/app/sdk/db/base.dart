// import 'package:sqflite/sqflite.dart';
// import 'app_database.dart';
//
// class DBase {
//   final String tableName;
//   final ConflictAlgorithm conflictAlgorithm;
//
//   DBase({
//     required this.tableName,
//     this.conflictAlgorithm = ConflictAlgorithm.ignore,
//   });
//
//   Future<int> insert(Map<String, dynamic> data) async {
//     final db = await AppDatabase.instance.database;
//     return db.insert(tableName, data, conflictAlgorithm: conflictAlgorithm);
//   }
//
//   Future<void> insertList(List<Map<String, dynamic>> dataList) async {
//     if (dataList.isEmpty) return;
//
//     final db = await AppDatabase.instance.database;
//     final batch = db.batch();
//     for (final item in dataList) {
//       batch.insert(tableName, item, conflictAlgorithm: conflictAlgorithm);
//     }
//     await batch.commit(noResult: true);
//   }
//
//   Future<List<Map<String, dynamic>>> rawQuery(String sql) async {
//     final db = await AppDatabase.instance.database;
//     return db.rawQuery(sql);
//   }
// }
