import 'package:dio/dio.dart';

import '../../../models/food_recipe.dart';

class FoodRecipe {
  static const connectionTime = 2400;
  static const receviedTime = 2400;
  static const senderTime = 2400;
  static const baseurl = 'https://dummyjson.com/recipes';
  static final dio = Dio(BaseOptions(
    baseUrl: baseurl,
    connectTimeout: const Duration(seconds: connectionTime),
    receiveTimeout: const Duration(seconds: receviedTime),
    sendTimeout: const Duration(seconds: receviedTime),
  ));
  Future<List<Recipes>?> getRecipe() async {
    try {
      final response = await dio.get(baseurl);
      if (response.data['recipes'] != null) {
        final List<dynamic> item = response.data['recipes'];
        return item.map((e) => Recipes.fromJson(e)).toList();
      } else {
        Exception(toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
