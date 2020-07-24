import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interns_task/choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_task/screens/welcome_screen.dart';

FirebaseUser loggedInUser;

class HomeScreen extends StatefulWidget {
  static String id = 'image_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loggedInUser == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green.withOpacity(0.8),
              title: const Text('Home Screen'),
              bottom: TabBar(
                isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              )),
          drawer: Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      child: Center(
                        child: Text(
                          '${loggedInUser.email}',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                      child: Container(
                        child: Text('Log Out'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
}
