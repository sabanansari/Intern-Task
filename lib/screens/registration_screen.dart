import 'package:flutter/material.dart';
import 'package:interns_task/constants.dart';
import 'package:interns_task/widgets/enter_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_task/screens/home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

var _scaffoldKey = GlobalKey<ScaffoldState>();

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String confirmPassword;
  String name;
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    setState(() {
      password = confirmPassword;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/greenshutter.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Fill it';
                    }
                    if (!RegExp(r"[a-zA-Z]+\\.?").hasMatch(value)) {
                      return 'Please enter valid name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your name'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email Address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter the email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter the password'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter to Confirm password';
                    }
                    return null;
                  },
                  obscureText: true,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: password == confirmPassword
                      ? kTextFieldDecoration.copyWith(
                          hintText: 'Confirm the password')
                      : kTextFieldDecoration.copyWith(
                          hintText: 'Re-enter Password'),
                ),
                SizedBox(
                  height: 48.0,
                ),
                EnterButton(
                  label: 'Sign Up',
                  colour: Colors.green,
                  onPressed: () async {
                    setState(() async {
                      showSpinner = true;
                      if (_formKey.currentState.validate()) {
                        if (password == confirmPassword) {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, HomeScreen.id);

                              setState(() {
                                showSpinner = false;
                                SnackBar snackBar = SnackBar(
                                  content: Text(
                                    'Registered Successfully',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Enter the fields carefully'),
                          ));
                        }
                      } else {}
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
