import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:interns_task/screens/registration_screen.dart';
import 'package:interns_task/widgets/enter_button.dart';
import 'package:flutter/animation.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: animation.value * 80,
                      width: 80.0,
                      child: Image.asset('images/greenshutter.png'),
                    ),
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
              label: 'Sign In',
              colour: Colors.lightGreen,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            EnterButton(
              label: 'Sign Up',
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
