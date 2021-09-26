import 'package:flutter/material.dart';

import '../data/dummy.data.dart';

class SingleRecipeDetails extends StatelessWidget {
  static const route = "/meal-recipe";

  const SingleRecipeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedRecipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const Headings(title: "Ingrediants"),
            TextContainer(
              widget: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      selectedRecipe.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedRecipe.ingredients.length,
              ),
            ),
            const Headings(title: "Steps"),
            TextContainer(
              widget: ListView.builder(
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryVariant,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(selectedRecipe.steps[index]),
                  ),
                  const Divider(
                    height: 5,
                  )
                ]),
                itemCount: selectedRecipe.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Headings extends StatelessWidget {
  final String title;
  const Headings({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final Widget widget;
  const TextContainer({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: widget,
    );
  }
}
