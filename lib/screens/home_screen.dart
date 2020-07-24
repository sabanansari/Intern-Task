import 'package:flutter/material.dart';
import 'package:interns_task/choice.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'image_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Tapped AppBar'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            )),
        body: TabBarView(
          children: choices.map((Choice choice) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: ChoicePage(
                choice: choice,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
