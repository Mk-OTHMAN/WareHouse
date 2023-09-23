import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class ItemModelData extends StatelessWidget {
  String modelName;
  String modelColorOne;
  String modelColorTwo;
  int? totalQuantaty;
  int? colorOneQuantaty;
  int? colorTwoQuantaty;

  ItemModelData(
      {super.key,
      required this.modelName,
      required this.totalQuantaty,
      required this.modelColorOne,
      required this.modelColorTwo,
      required this.colorOneQuantaty,
      required this.colorTwoQuantaty});
  Box data = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // **************** Model Name Container *******************
        Container(
          width: 120.w,
          height: 30.h,
          decoration: BoxDecoration(
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              modelName,
              style: TextStyle(
                  fontSize: 6.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),

        // ***************  Model Quntaty Container  ******************

        Container(
          width: 120.w,
          height: 30.h,
          decoration: BoxDecoration(
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              '$totalQuantaty',
              style: TextStyle(
                  fontSize: 5.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),

        //  *****************  Color Item Container **************

        Container(
            width: 120.w,
            height: 30.h,
            decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20.w),
                // ___________ Avilabel color Numbers _________
                Center(
                  child: Text(
                    '$colorOneQuantaty',
                    style: TextStyle(
                        fontSize: 5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                // ___________  contiue Avilabel color Numbers __________
                Center(
                  child: Text(
                    '$colorTwoQuantaty',
                    style: TextStyle(
                        fontSize: 5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
