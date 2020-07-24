import 'package:flutter/material.dart';
import 'screens/contact_screen.dart';
import 'screens/images_screen.dart';
import 'screens/view_images_screen.dart';

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Images', icon: Icons.add_photo_alternate),
  Choice(title: 'View Images', icon: Icons.image),
  Choice(title: 'Contact Us', icon: Icons.contacts),
];

class ChoicePage extends StatelessWidget {
  final Choice choice;

  ChoicePage({this.choice});

  @override
  Widget build(BuildContext context) {
    if (choice.icon == Icons.contacts) {
      return ContactScreen();
    } else if(choice.icon == Icons.add_photo_alternate){
      return ImagesScreen();
    }
    else{
      return ViewImagesScreen();
    }
  }
}
