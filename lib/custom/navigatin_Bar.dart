import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtomNavigate extends StatelessWidget {
  final String back, home, pageEdit;
  final Color frontColor, backColor;
  const CustomButtomNavigate(
      {super.key,
      required this.frontColor,
      required this.backColor,
      required this.back,
      required this.home,
      required this.pageEdit});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        height: 30.h,
        buttonBackgroundColor: Colors.white70,
        color: frontColor,
        backgroundColor: backColor,
        // const Color(0xffFF735C),
        items: [
          const Icon(Icons.arrow_back_ios_new),
          const Icon(Icons.home),
          Text('Edit',
              style: TextStyle(fontSize: 4.sp, fontWeight: FontWeight.bold)),
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pushNamed(home);
          } else if (value == 0) {
            Navigator.of(context).pushNamed(back);
          } else if (value == 2) {
            Navigator.of(context).pushNamed(pageEdit);
          }
        });
  }
}
