import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  String emailId = 'abcde@xyz.com';
  int number = 919123456789;

  void _launchEmail(emailId) async {
    var url = "mailto:$emailId";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send email';
    }
  }

  void _launchCaller(number) async {
    var url = "tel:${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contact Us',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                _launchCaller(number);
              },
              child: Text(
                'Phone No.: +$number',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                _launchEmail(emailId);
              },
              child: Text(
                'Email id: $emailId',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
