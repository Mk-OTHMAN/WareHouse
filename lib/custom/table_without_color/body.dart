import 'package:flutter/material.dart';

class TableBodyNoColor extends StatelessWidget {
  final Widget modelName, quantity;
  const TableBodyNoColor({
    super.key,
    required this.modelName,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [modelName, quantity])
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
