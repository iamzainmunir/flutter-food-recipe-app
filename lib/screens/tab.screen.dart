import 'package:flutter/material.dart';

import './categories.screen.dart';
import './favourite.screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Famouse Food Recipes"),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Categories",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryScreen(),
            Favourite(),
          ],
        ),
      ),
    );
  }
}
