import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String buttonName;
  final String pagePath;
  final Color buttonColor;
  final Color fontColor;
  final double fontSize;
  final double width;
  final double height;

  const CustomOutlineButton(
      {super.key,
      required this.buttonName,
      required this.pagePath,
      required this.buttonColor,
      required this.fontSize,
      required this.fontColor,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return // ______________  outline buttom _________
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(pagePath);
            },
            style: OutlinedButton.styleFrom(
              fixedSize: Size(width, height),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              side: BorderSide(color: buttonColor),
            ),
            child: Text(
              buttonName,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: fontColor),
            ));
  }
}
