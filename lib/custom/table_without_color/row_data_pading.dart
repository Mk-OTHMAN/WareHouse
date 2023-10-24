import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowDataModelNamePading extends StatelessWidget {
  final String componentName;
  const RowDataModelNamePading({super.key, required this.componentName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Container(
        padding: EdgeInsets.only(left: 60.w),
        margin: EdgeInsets.only(left: 25.w),
        alignment: Alignment.centerLeft,
        child: Text(
          componentName,
          style: GoogleFonts.urbanist(
              decoration: TextDecoration.none,
              fontSize: 6.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
