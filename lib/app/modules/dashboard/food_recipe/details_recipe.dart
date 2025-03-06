import 'package:auth_app/app/sdk/extension/extension.dart';
import 'package:auth_app/app/sdk/models/food_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sdk/widget/custom_fill_button.dart';
import 'food_recipe_cubit.dart';

class DetailsRecipe extends StatelessWidget {
  const DetailsRecipe({super.key, required this.recipes});
  final Recipes recipes;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodRecipeCubit(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(recipes.name ?? ''),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Image.asset(
                      recipes.image ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, child) {
                        return Image.asset('lib/app/assets/food.jpg');
                      },
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(recipes.name ?? ''),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(recipes.mealType.toString() ?? ''),
                          ],
                        ),
                        Text(recipes.tags.toString() ?? ''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(recipes.cuisine.toString() ?? ''),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(recipes.difficulty.toString() ?? ''),
                          ],
                        ),
                        Text(recipes.instructions.toString() ?? ''),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFillButton(
                                isloading: false,
                                label: 'Add to Cart',
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ).addAllPad(10)
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
