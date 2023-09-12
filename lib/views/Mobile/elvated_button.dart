// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ElevatedButtonMobile extends StatelessWidget {
  String? text;
  String pageName;
  ElevatedButtonMobile({super.key, required this.text, required this.pageName});
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double sizeBoxH = MediaQuery.of(context).size.height;

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(pageName);
            },
            style: ElevatedButton.styleFrom(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                fixedSize: Size(width * .40, height * .04),
                backgroundColor: color),
            child: Text(
              '$text',
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: sizeBoxH * .015,
        )
      ],
    );
  }
}
