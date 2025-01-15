import 'package:auth_app/app/sdk/db/food_recipe/table.dart';
import 'package:auth_app/app/sdk/db/user/table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase _appDatabase = AppDatabase._internal();
  static const String dbName = 'Auth_DB.db';

  late Database _database;
  bool _initialized = false;

  AppDatabase._internal();

  static AppDatabase get get => _appDatabase;

  Future<Database> get dB async {
    if (!_initialized) {
      await _initialize();
    }
    return _database;
  }

  Future<void> _initialize() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await _userTable(db);
        await _foodRecipeTable(db);
      },
    );
    _initialized = true;
  }

  Future _foodRecipeTable(Database db) async {
    return db.execute('''
    CREATE TABLE ${FoodRecipeTable.tableName} (
      ${FoodRecipeTable.userId} INTEGER PRIMARY KEY,
      ${FoodRecipeTable.dbname} TEXT,
      ${FoodRecipeTable.dbData} TEXT
    )
  ''');
  }

  Future _userTable(Database db) async {
    return db.execute('''
    CREATE TABLE ${UserTable.userTable} (
      ${UserTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${UserTable.usertoken} TEXT
    )
  ''');
  }
}
