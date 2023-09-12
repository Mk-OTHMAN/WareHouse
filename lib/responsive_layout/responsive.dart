import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget taplet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.taplet,
      required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobile;
      } else if (constraints.maxWidth < 1000) {
        return taplet;
      } else {
        return desktop;
      }
    });
  }
}
