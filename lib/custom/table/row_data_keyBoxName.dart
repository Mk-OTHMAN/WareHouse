import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RowDataKeyBoxName extends StatelessWidget {
  final String keyBoxName;
  const RowDataKeyBoxName({super.key, required this.keyBoxName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Text(
          keyBoxName,
          style: GoogleFonts.urbanist(
              fontSize: 5.sp, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
