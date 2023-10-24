import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtomNavigateForEditPage extends StatelessWidget {
  final String back, home;
  final Color frontColor, backColor;
  const CustomButtomNavigateForEditPage({
    super.key,
    required this.frontColor,
    required this.backColor,
    required this.back,
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        height: 30.h,
        buttonBackgroundColor: Colors.white70,
        color: frontColor,
        backgroundColor: backColor,
        // const Color(0xffFF735C),
        items: const [
          Icon(Icons.arrow_back_ios_new),
          Icon(Icons.home),
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pushNamed(home);
          } else if (value == 0) {
            Navigator.of(context).pushNamed(back);
          }
        });
  }
}
