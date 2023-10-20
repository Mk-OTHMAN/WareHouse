import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TableHeaderNoColor extends StatelessWidget {
  const TableHeaderNoColor({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                tableHeaderFunction('MODEL NUMBER', Colors.green),
                tableHeaderFunction('QUANTITY', Colors.red),
              ]),
            ]),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }

  Widget tableHeaderFunction(String headerName, Color headerCoolor) {
    return SizedBox(
      height: 55.h,
      // color: headerCoolor,
      child: Center(
          child: Text(
        headerName,
        style: GoogleFonts.lilitaOne(
            decoration: TextDecoration.none,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: headerCoolor),
      )),
    );
  }
}
