import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse/custom/text_field.dart';

class ComponentButtomSheet extends StatelessWidget {
  final String componentName;
  final TextEditingController textController;
  const ComponentButtomSheet(
      {super.key, required this.componentName, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          componentName,
          style: GoogleFonts.eduSaBeginner(
              color: Colors.black, fontSize: 7.sp, fontWeight: FontWeight.bold),
        ),
        //  ######  sizedBox  ########
        SizedBox(height: 15.h),
        //  ______tetxt form field  ______ //
        SizedBox(
            // height: 50,
            width: 28.w,
            child: CustomTextField(textEditingController: textController)),
      ],
    );
  }
}
