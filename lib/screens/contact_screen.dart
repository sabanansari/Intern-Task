import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
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
                color: Colors.black87,
              ),
            ),
            Text(
              'Phone No.: +91 9123456789',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'Email id: abcde@xyz.com',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
