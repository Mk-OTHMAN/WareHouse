import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse/custom/text_field.dart';

class component_buttom_sheet extends StatelessWidget {
  late String componentName;
  TextEditingController textController;
  component_buttom_sheet(
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
            width: 33.w,
            child: CustomTextField(textEditingController: textController)),
      ],
    );
  }
}
