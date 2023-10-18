import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeaderTabel extends StatelessWidget {
  const CustomHeaderTabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // **************** Model Name Container *******************
        Container(
          width: 120.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.red,
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              'Model Name',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        // ***************  Model Quntaty Container  ******************

        Container(
          width: 120.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.amber,
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              ' QUANTITY ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        //  *****************  Color Item Container **************

        Container(
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.green,
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 30.w,
                  child: Text(
                    'Color',
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'SL',
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  'CH',
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                )
              ],
            ))
      ],
    );
  }
}
