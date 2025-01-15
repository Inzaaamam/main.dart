import 'dart:convert';
import 'package:auth_app/app/sdk/db/food_recipe/table.dart';
import 'package:auth_app/app/sdk/utils/utils.dart';
import 'package:bloc/bloc.dart';
import '../../../sdk/db/food_recipe/food_recipe.dart';
import '../../../sdk/models/food_recipe.dart';
import '../../../sdk/services/api/entities/food_recipe.dart';
import 'food_recipe_state.dart';

class FoodRecipeCubit extends Cubit<FoodRecipeState> {
  FoodRecipeCubit() : super(const FoodRecipeState()) {
    inIt();
  }
  Future<void> inIt() async {
    await insertFoodRecipeData();
    await getAllRecipeData();
  }

  Future<List<Recipes>?> insertFoodRecipeData() async {
    emit(state.copyWith(isloading: true));
    try {
      final List<FoodRecipeTable> recipetable = [];
      final response = await FoodRecipe().getRecipe();
      if (response != null && response.isNotEmpty) {
        for (var recipe in response) {
          recipetable.add(FoodRecipeTable.create(
            id: recipe.userId!.toInt(),
            name: recipe.name.toString(),
            data: jsonEncode(recipe),
          ));
        }
        if (recipetable.isNotEmpty) {
          await DaoFoodRecipe.get.insertList(
            recipetable.map((e) => e.toJson()).toList(),
          );
        }
        emit(state.copyWith(isloading: false, status: Status.success, recipe: response));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.fail, isloading: false));
      rethrow;
    }
    return null;
  }

  Future<void> getAllRecipeData() async {
    emit(state.copyWith(isloading: true));
    try {
      final results = await DaoFoodRecipe.get.getAllRecipes();
      final recipes = results.map((e) {
        final decodeRecipe = jsonDecode(e.data);
        return Recipes.fromJson(decodeRecipe);
      }).toList();
      emit(state.copyWith(
        recipe: recipes,
        status: Status.success,
        isloading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.fail,
        isloading: false,
      ));
      rethrow;
    }
  }
}
