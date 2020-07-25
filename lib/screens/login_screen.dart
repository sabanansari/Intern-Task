import 'package:flutter/material.dart';
import 'package:interns_task/widgets/enter_button.dart';
import 'package:interns_task/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

var _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  var _formKey = GlobalKey<FormState>();
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
                  height: 48.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
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
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter the email'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter the password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: EnterButton(
                    onPressed: () async {
                      setState(() async {
                        if (_formKey.currentState.validate()) {
                          showSpinner = true;
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, HomeScreen.id);
                              setState(() {
                                showSpinner = false;
                                SnackBar snackBar = SnackBar(
                                  content: Text(
                                    'Logged In Successfully',
                                  ),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              });
                            } else {
                              setState(() {
                                showSpinner = false;
                                SnackBar snackBar = SnackBar(
                                  content: Text(
                                    'Login Failed. Please check your credentials',
                                  ),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              });
                            }
                          } catch (e) {}
                        } else {
                          setState(() {
                            showSpinner = false;
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                'Login Failed. Please check your credentials',
                              ),
                            );
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          });
                        }
                      });
                    },
                    label: 'Sign In',
                    colour: Colors.lightGreen,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
