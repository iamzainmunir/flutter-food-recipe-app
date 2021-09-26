import 'package:flutter/material.dart';

import '../screens/filter.screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Happy Cooking !",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MenuItem(
            title: "Recipes",
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(
            height: 4,
            color: Colors.grey,
          ),
          MenuItem(
            title: "Filter",
            icon: Icons.settings,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed(FilterRecipe.route);
            },
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback tapHandler;

  MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.tapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
