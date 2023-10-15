import 'package:flutter/material.dart';

class TableBody extends StatelessWidget {
  final Widget modelName, quantity, color1KeyNme, color2KeyName;
  const TableBody(
      {super.key,
      required this.modelName,
      required this.quantity,
      required this.color1KeyNme,
      required this.color2KeyName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                children: [modelName, quantity, color1KeyNme, color2KeyName])
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
