import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagesScreen extends StatefulWidget {
  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final img = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(img.path);
    });
    Navigator.pop(context);
  }

  Future getImageCamera() async {
    final img = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(img.path);
    });
    Navigator.pop(context);
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text('Select From'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Photo with Camera'),
                onPressed: getImageCamera,
              ),
              SimpleDialogOption(
                child: Text('Image from Gallery'),
                onPressed: getImage,
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tap To Select Image',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300.0,
                width: 300.0,
                child: RaisedButton(
                  color: Colors.white.withOpacity(0.95),
                  onPressed: () {
                    selectImage(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image(
                      image: AssetImage('images/shutter.jpg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildImageScreen() {
    return Container(
      color: Colors.white54,
      child: Center(
        child: Column(
          children: <Widget>[
            Divider(),
            Container(
              height: 400.0,
              width: 400.0,
              child: Image.file(image),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Center(child: SingleChildScrollView(child: buildSplashScreen()))
        : buildImageScreen();
  }
}
