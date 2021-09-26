import 'package:flutter/material.dart';

import '../data/dummy.data.dart';
import '../widgets/category_item_recipe.dart';

class CategoryDetails extends StatelessWidget {
  static const route = "/category-details";

  const CategoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final filterSeletedCategoryRecipes = DUMMY_RECIPES.where(
      (recipe) {
        return recipe.categories.contains(args['id']);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title'].toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryItemRecipe(
            id: filterSeletedCategoryRecipes[index].id,
            title: filterSeletedCategoryRecipes[index].title,
            imageUrl: filterSeletedCategoryRecipes[index].imageUrl,
            duration: filterSeletedCategoryRecipes[index].duration,
            complexity: filterSeletedCategoryRecipes[index].complexity,
            affordability: filterSeletedCategoryRecipes[index].affordability,
          );
        },
        itemCount: filterSeletedCategoryRecipes.length,
      ),
    );
  }
}
