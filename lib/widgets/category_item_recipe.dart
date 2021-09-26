import 'package:flutter/material.dart';

import '../screens/single_recipe_details.screen.dart';
import '../models/recipes.dart';

class CategoryItemRecipe extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const CategoryItemRecipe({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  void showRecipe(context) {
    Navigator.of(context).pushNamed(SingleRecipeDetails.route, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showRecipe(context),
      splashColor: Theme.of(context).colorScheme.secondary,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            RecipesImageAndTitle(
              title: title,
              imageUrl: imageUrl,
            ),
            RecipesDurationComplexityAndAffordibility(
              duration: duration,
              complexity: complexity,
              affordability: affordability,
            )
          ],
        ),
      ),
    );
  }
}

class RecipesDurationComplexityAndAffordibility extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const RecipesDurationComplexityAndAffordibility({
    Key? key,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.schedule),
              const SizedBox(
                width: 6,
              ),
              Text('$duration min'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.work),
              const SizedBox(
                width: 6,
              ),
              Text(complexityText),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.attach_money),
              const SizedBox(
                width: 6,
              ),
              Text(affordabityText),
            ],
          ),
        ],
      ),
    );
  }
}

class RecipesImageAndTitle extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RecipesImageAndTitle({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            width: 300,
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
