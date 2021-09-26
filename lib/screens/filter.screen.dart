import 'package:flutter/material.dart';

import '../widgets/main_menu.dart';

class FilterRecipe extends StatelessWidget {
  static const route = "/filter-recipe";

  const FilterRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter recipes"),
      ),
      drawer: MainMenu(),
      body: Center(
        child: Text("Filter"),
      ),
    );
  }
}
