import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Routes/rutes_name.dart';

class CustomButtomNavigate extends StatelessWidget {
  String back;
  CustomButtomNavigate({super.key, required this.back});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        buttonBackgroundColor: Colors.white70,
        color: Colors.white70,
        backgroundColor: const Color(0xffFF735C),
        items: const [
          Icon(Icons.arrow_back_ios_new),
          Icon(Icons.home),
          Icon(Icons.edit),
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pushNamed(Routes.home);
          } else if (value == 0) {
            Navigator.of(context).pushNamed(back);
          } else if (value == 2) {
            Navigator.of(context).pushNamed(Routes.freezerToshipaEdit);
          }
        });
  }
}
