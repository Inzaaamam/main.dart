import 'package:auth_app/app/modules/dashboard/food_recipe/food_recipe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../routes/constant.dart';
import '../../../sdk/utils/utils.dart';
import 'food_recipe_cubit.dart';

class FoodRecipeScreen extends StatelessWidget {
  const FoodRecipeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodRecipeCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            automaticallyImplyLeading: true,
            title: const Text('Food Recipe Data'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<FoodRecipeCubit>().getAllRecipeData();
            },
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<FoodRecipeCubit, FoodRecipeState>(
            builder: (context, state) {
              if (state.status == Status.success) {
                final recipe = state.recipe;
                return ListView.builder(
                  itemCount: recipe?.length,
                  itemBuilder: (context, index) {
                    final item = recipe?[index];
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.details_recipe, arguments: item);
                        },
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item?.image != null)
                                SizedBox(
                                    child: Image.asset(
                                  item?.image ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, child) {
                                    return Image.asset('lib/app/assets/food.jpg');
                                  },
                                )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item?.name ?? ''),
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                    );
                  },
                );
              } else if (state.status == Status.fail) {
                return const Center(child: Text('Failed to load recipes'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      }),
    );
  }
}
