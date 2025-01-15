import 'package:auth_app/app/sdk/db/app_database.dart';
import 'package:auth_app/app/sdk/db/food_recipe/table.dart';
import 'package:sqflite/sqflite.dart';

class DaoFoodRecipe {
  static final DaoFoodRecipe _daoFoodRecipe = DaoFoodRecipe._internal();

  DaoFoodRecipe._internal();

  static DaoFoodRecipe get get => _daoFoodRecipe;

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await AppDatabase.get.dB;
    return db.insert(
      FoodRecipeTable.tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertList(List<Map<String, dynamic>> dataList) async {
    if (dataList.isEmpty) return;
    final db = await AppDatabase.get.dB;
    final batch = db.batch();
    for (final item in dataList) {
      batch.insert(
        FoodRecipeTable.tableName,
        item,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<FoodRecipeTable>> getAllRecipes() async {
    try {
      final db = await AppDatabase.get.dB;
      final response = await db.query(
        FoodRecipeTable.tableName,
      );
      return response.map((e) => FoodRecipeTable.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch recipes with filter $e');
    }
  }

  Future<void> deleteTable() async {
    final db = await AppDatabase.get.dB;
    await db.delete(FoodRecipeTable.tableName);
  }

  Future<List<Map<String, dynamic>>> rawQuery(
    String sql, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      Database? db = await await AppDatabase.get.dB;
      if (where != null) {
        sql = '$sql ' + where;
      }
      return db.rawQuery(sql, whereArgs);
    } catch (e) {
      throw Exception(e);
    }
  }
}
