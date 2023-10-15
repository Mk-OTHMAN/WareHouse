import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellDeep18 extends StatefulWidget {
  const SellDeep18({super.key});

  @override
  State<SellDeep18> createState() => _SellDeep18State();
}

class _SellDeep18State extends State<SellDeep18> {
  int valueDeleteQuantatyFreezer18 = 0;
  int valueDeleteColor1Freezer18 = 0;
  int valueDeleteColor2Freezer18 = 0;
  int dtotal18 = 0;
  int dcolor1f18 = 0;
  int dcolor2f18 = 0;
  TextEditingController deletetotal18 = TextEditingController();
  TextEditingController delete18color1 = TextEditingController();
  TextEditingController delete18color2 = TextEditingController();
  Box data = Hive.box('data');
  void showDialogFunction(String title, String contetnt, String lottiPath) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            content: Text(contetnt),
            actions: [
              Center(
                child: SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Lottie.asset(lottiPath),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var dt18 = deletetotal18;
    var dc1f18 = delete18color1;
    var dc2f18 = delete18color2;

    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text('Sell',
                style: GoogleFonts.rowdies(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold)),
            // ________  Row body for text form field ______ //
            SizedBox(height: 25.h),
            Row(
              children: [
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'Total Quantity',
                        textController: deletetotal18)),

                //  ########### column color quantaty #########

                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'SL Quantity',
                        textController: delete18color1)),

                // ############## column coolor quantaty ########
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'CH Quantity',
                        textController: delete18color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt18.text.isEmpty &&
                        dc1f18.text.isEmpty &&
                        dc2f18.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1f18.text.isEmpty && dc2f18.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt18.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt18.text.isEmpty && dc2f18.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1f18.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt18.text.isEmpty && dc1f18.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2f18.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt18.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1f18.clear();
                      dc2f18.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total18') == 0) {
                      dtotal18 = int.parse(deletetotal18.text);
                      if (dtotal18 > data.get('total18')) {
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt18.clear();
                        dc1f18.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('color1') == 0 || dcolor1f18 > 0) {
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (dcolor1f18 > data.get('color1') &&
                          data.get('color1') > 0) {
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1f18.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('color2') == 0 || dcolor1f18 > 0) {
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (dcolor2f18 > data.get('color2') &&
                          data.get('color2') > 0) {
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt18.text.isNotEmpty &&
                        dc1f18.text.isNotEmpty &&
                        dc2f18.text.isNotEmpty) {
                      dtotal18 = int.parse(dt18.text);
                      dcolor1f18 = int.parse(dc1f18.text);
                      dcolor2f18 = int.parse(dc2f18.text);
                      if (dtotal18 > data.get('total18') &&
                              data.get('total18') >= 0 ||
                          dcolor1f18 > data.get('color1') &&
                              data.get('color1') >= 0 ||
                          dcolor2f18 > data.get('color2') &&
                              data.get('color2') >= 0) {
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt18.clear();
                        dc1f18.clear();
                        dc2f18.clear();
                      } else {
                        dtotal18 = int.parse(dt18.text);
                        dcolor1f18 = int.parse(dc1f18.text);
                        dcolor2f18 = int.parse(dc2f18.text);
                        valueDeleteQuantatyFreezer18 =
                            data.get('total18') - dtotal18;
                        data.put('total18', valueDeleteQuantatyFreezer18);
                        valueDeleteColor1Freezer18 =
                            data.get('color1') - dcolor1f18;
                        data.put('color1', valueDeleteColor1Freezer18);
                        valueDeleteColor2Freezer18 =
                            data.get('color2') - dcolor2f18;
                        data.put('color2', valueDeleteColor2Freezer18);
                        showDialogFunction(
                            'WRONG',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt18.clear();
                        dc1f18.clear();
                        dc2f18.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2f18.text.isEmpty) {
                      if (data.get('total18') > 0 || data.get('color1') > 0) {
                        dtotal18 = int.parse(dt18.text);
                        dcolor1f18 = int.parse(dc1f18.text);

                        if (dtotal18 > data.get('total18') ||
                            dcolor1f18 > data.get('color1')) {
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal18 = int.parse(dt18.text);
                          dcolor1f18 = int.parse(dc1f18.text);
                          valueDeleteQuantatyFreezer18 =
                              data.get('total18') - dtotal18;
                          data.put('total18', valueDeleteQuantatyFreezer18);

                          valueDeleteColor1Freezer18 =
                              data.get('color1') - dcolor1f18;
                          data.put('color1', valueDeleteColor1Freezer18);

                          showDialogFunction(
                              'WRONG',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt18.clear();
                      dc1f18.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1f18.text.isEmpty) {
                      if (data.get('total18') > 0 || data.get('color2') > 0) {
                        dtotal18 = int.parse(dt18.text);
                        dcolor2f18 = int.parse(dc2f18.text);
                      }
                      if (dtotal18 > data.get('total18') ||
                          dcolor2f18 > data.get('color2')) {
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt18.clear();
                        dc2f18.clear();
                      } else {
                        dtotal18 = int.parse(dt18.text);
                        dcolor2f18 = int.parse(dc2f18.text);
                        valueDeleteQuantatyFreezer18 =
                            data.get('total18') - dtotal18;
                        data.put('total18', valueDeleteQuantatyFreezer18);
                        // dt18.clear();

                        valueDeleteColor2Freezer18 =
                            data.get('color2') - dcolor2f18;
                        data.put('color2', valueDeleteColor2Freezer18);

                        //dc2f18.clear();
                        showDialogFunction(
                            'WRONG',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt18.clear();
                    dc2f18.clear();
                  });
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }
}
