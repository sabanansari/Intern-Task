import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  static String id = 'image_screen';
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Reached')),
    );
  }
}
