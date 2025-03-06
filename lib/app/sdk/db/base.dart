// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DB {
//   static final DB _db = DB._internal();
//   DB._internal();
//   late Database _database;
//   static const dbName = 'User';
//   static DB get get => _db;
//   bool intialized = false;
//
//   Future<Database> getDB() async {
//     if (!intialized) await openDB;
//     return _database;
//   }
//
//   Future<void> openDB() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, dbName);
//     _database = await openDatabase(path,
//         version: 1, onCreate: (Database db, int version) async {});
//     intialized = true;
//   }
// }
