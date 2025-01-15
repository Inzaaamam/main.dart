class FoodRecipeTable {
  static const tableName = 'Food_Recipe';
  static const userId = 'userId';
  static const dbname = 'name';
  static const dbData = 'mobile_data';

  int id;
  String name;
  String data;
  FoodRecipeTable.create({required this.id, required this.name, required this.data});
  FoodRecipeTable.update({required this.id, required this.name, required this.data});
  FoodRecipeTable.fromJson(Map<String, dynamic> json)
      : id = json[userId],
        name = json[dbname],
        data = json[dbData];
  FoodRecipeTable.fromMap(Map<String, dynamic> json)
      : id = json[userId],
        name = json[dbname],
        data = json[dbData];
  Map<String, dynamic> toJson() {
    return {
      userId: id,
      dbname: name,
      dbData: data,
    };
  }
}
