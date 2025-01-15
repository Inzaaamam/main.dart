import 'package:auth_app/app/sdk/models/food_recipe.dart';
import 'package:equatable/equatable.dart';

import '../../../sdk/utils/utils.dart';

class FoodRecipeState extends Equatable {
  const FoodRecipeState({this.status, this.recipe, this.isLoading = false});
  final Status? status;
  final List<Recipes>? recipe;
  final bool isLoading;
  FoodRecipeState copyWith({Status? status, List<Recipes>? recipe, bool? isloading}) {
    return FoodRecipeState(
        status: status ?? this.status,
        recipe: recipe ?? recipe,
        isLoading: isloading ?? isLoading);
  }

  @override
  List<Object?> get props => [status, recipe, isLoading];
}
