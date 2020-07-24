import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('image/greenshutter.png'),
                ),
                TypewriterAnimatedTextKit(
                  text: ['ViewImage App'],
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
          ],
        ),
      ),
    );
  }
}
