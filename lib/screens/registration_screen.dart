import 'package:flutter/material.dart';
import 'package:interns_task/constants.dart';
import 'package:interns_task/widgets/enter_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            Flexible(
              child: Container(
                height: 200.0,
                child: Image.asset('images/greenshutter.png'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter the email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {},
              textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter the password'),
            ),
            SizedBox(
              height: 48.0,
            ),
            EnterButton(
              label: 'Register',
              colour: Colors.green,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
