import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:interns_task/screens/registration_screen.dart';
import 'package:interns_task/widgets/enter_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.6),
        title: Text(
          'ViewImage App',
          style: TextStyle(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 100.0,
                    width: 80.0,
                    child: Image.asset('images/greenshutter.png'),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['ViewImage App'],
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            EnterButton(
              label: 'Login',
              colour: Colors.lightGreen,
              onPressed: () {},
            ),
            EnterButton(
              label: 'Register',
              colour: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
