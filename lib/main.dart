import 'package:flutter/material.dart';

import './screens/categories.screen.dart';
import './screens/category_details.screen.dart';
import './screens/single_recipe_details.screen.dart';
import './screens/error_page.screen.dart';
import './screens/tab.screen.dart';
import './screens/bottom_tab.screen.dart';
import './screens/filter.screen.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
        indicatorColor: Colors.amber,
      ),
      routes: {
        "/": (ctx) => const BottomTabScreen(),
        CategoryDetails.route: (ctx) => const CategoryDetails(),
        SingleRecipeDetails.route: (ctx) => const SingleRecipeDetails(),
        FilterRecipe.route: (ctx) => const FilterRecipe()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const ErrorPage());
      },
    );
  }
}
