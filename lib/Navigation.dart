import 'package:flutter/material.dart';
import 'package:movie_catalog/main.dart';
import 'package:movie_catalog/movieCatalogPage.dart';

class daNavigationBarApp extends StatelessWidget {
  const daNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const daNavigationBar(),
    );
  }
}

class daNavigationBar extends StatefulWidget {
  const daNavigationBar({super.key});

  @override
  State<daNavigationBar> createState() => daNavigationBarState();
}

class daNavigationBarState extends State<daNavigationBar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.calculate_sharp),
                label: "Calculator",
              ),
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ]),
        body: <Widget>[
          const MyApp(),
          const MovieCatalogPage(),
          const MyHomePage(title: "Movie Catalog App"),
        ][currentPageIndex]);
  }
}
