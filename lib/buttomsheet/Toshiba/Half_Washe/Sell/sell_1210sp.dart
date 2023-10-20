import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1210sp extends StatefulWidget {
  const SellW1210sp({super.key});

  @override
  State<SellW1210sp> createState() => _SellW1210spState();
}

class _SellW1210spState extends State<SellW1210sp> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1210sp = 0;
    int valueDelete1210spColor1 = 0;
    int valueDelete1210spColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1210sp = 0;
    int d1210spcolor1 = 0;
    int d1210spcolor2 = 0;
    TextEditingController deletetotal1210sp = TextEditingController();
    TextEditingController delete1210spcolor1 = TextEditingController();
    TextEditingController delete1210spcolor2 = TextEditingController();
    var dt1210sp = deletetotal1210sp;
    var dc1W1210sp = delete1210spcolor1;
    var dc2W1210sp = delete1210spcolor2;
    if (data.get('total1210sp') == null) {
      data.put('total1210sp', 0);
    }
    if (data.get('1210spcolor1') == null) {
      data.put('1210spcolor1', 0);
    }
    if (data.get('1210spcolor2') == null) {
      data.put('1210spcolor2', 0);
    }
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
                //! _________    total quantity ________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'Total Quantity',
                        textController: deletetotal1210sp)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: delete1210spcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: delete1210spcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt1210sp.text.isEmpty &&
                        dc1W1210sp.text.isEmpty &&
                        dc2W1210sp.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W1210sp.text.isEmpty &&
                        dc2W1210sp.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt1210sp.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt1210sp.text.isEmpty && dc2W1210sp.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1210sp.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt1210sp.text.isEmpty && dc1W1210sp.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W1210sp.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt1210sp.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1210sp.clear();
                      dc2W1210sp.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total1210sp') == 0) {
                      //! =======> 👀
                      dtotal1210sp = int.parse(deletetotal1210sp.text);
                      if (dtotal1210sp > data.get('total1210sp')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt1210sp.clear();
                        dc1W1210sp.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('1210spcolor1') == 0 ||
                        d1210spcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1210spcolor1 >
                              data.get('1210spcolor1') && //! =======> 👀
                          data.get('1210spcolor1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W1210sp.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('1210spcolor2') == 0 ||
                        d1210spcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1210spcolor2 >
                              data.get('1210spcolor2') && //! =======> 👀
                          data.get('1210spcolor2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt1210sp.text.isNotEmpty &&
                        dc1W1210sp.text.isNotEmpty &&
                        dc2W1210sp.text.isNotEmpty) {
                      dtotal1210sp = int.parse(dt1210sp.text);
                      d1210spcolor1 = int.parse(dc1W1210sp.text);
                      d1210spcolor2 = int.parse(dc2W1210sp.text);
                      if (dtotal1210sp >
                                  data.get('total1210sp') && //! =======> 👀
                              data.get('total1210sp') >= 0 || //! =======> 👀
                          d1210spcolor1 >
                                  data.get('1210spcolor1') && //! =======> 👀
                              data.get('1210spcolor1') >= 0 || //! =======> 👀
                          d1210spcolor2 >
                                  data.get('1210spcolor2') && //! =======> 👀
                              data.get('1210spcolor2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt1210sp.clear();
                        dc1W1210sp.clear();
                        dc2W1210sp.clear();
                      } else {
                        dtotal1210sp = int.parse(dt1210sp.text);
                        d1210spcolor1 = int.parse(dc1W1210sp.text);
                        d1210spcolor2 = int.parse(dc2W1210sp.text);
                        valueDeleteQuantaty1210sp = data.get('total1210sp') -
                            dtotal1210sp; //! =======> 👀
                        data.put('total1210sp',
                            valueDeleteQuantaty1210sp); //! =======> 👀
                        valueDelete1210spColor1 = data.get('1210spcolor1') -
                            d1210spcolor1; //! =======> 👀
                        data.put('1210spcolor1',
                            valueDelete1210spColor1); //! =======> 👀
                        valueDelete1210spColor2 = data.get('1210spcolor2') -
                            d1210spcolor2; //! =======> 👀
                        data.put('1210spcolor2',
                            valueDelete1210spColor2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt1210sp.clear();
                        dc1W1210sp.clear();
                        dc2W1210sp.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W1210sp.text.isEmpty) {
                      if (data.get('total1210sp') > 0 || //! =======> 👀
                          data.get('1210spcolor1') > 0) {
                        //! =======> 👀
                        dtotal1210sp = int.parse(dt1210sp.text);
                        d1210spcolor1 = int.parse(dc1W1210sp.text);

                        if (dtotal1210sp >
                                data.get('total1210sp') || //! =======> 👀
                            d1210spcolor1 > data.get('1210spcolor1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal1210sp = int.parse(dt1210sp.text);
                          d1210spcolor1 = int.parse(dc1W1210sp.text);
                          valueDeleteQuantaty1210sp = data.get('total1210sp') -
                              dtotal1210sp; //! =======> 👀
                          data.put('total1210s',
                              valueDeleteQuantaty1210sp); //! =======> 👀

                          valueDelete1210spColor1 = data.get('1210spcolor1') -
                              d1210spcolor1; //! =======> 👀
                          data.put('1210spcolor1',
                              valueDelete1210spColor1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt1210sp.clear();
                      dc1W1210sp.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W1210sp.text.isEmpty) {
                      if (data.get('total1210sp') > 0 || //! =======> 👀
                          data.get('1210spcolor2') > 0) {
                        //! =======> 👀
                        dtotal1210sp = int.parse(dt1210sp.text);
                        d1210spcolor2 = int.parse(dc2W1210sp.text);
                      }
                      if (dtotal1210sp >
                              data.get('total1210sp') || //! =======> 👀
                          d1210spcolor2 > data.get('1210spcolor2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt1210sp.clear();
                        dc2W1210sp.clear();
                      } else {
                        dtotal1210sp = int.parse(dt1210sp.text);
                        d1210spcolor2 = int.parse(dc2W1210sp.text);
                        valueDeleteQuantaty1210sp = data.get('total1210sp') -
                            dtotal1210sp; //! =======> 👀
                        data.put('total1210sp',
                            valueDeleteQuantaty1210sp); //! =======> 👀
                        // dt18.clear();

                        valueDelete1210spColor2 = data.get('1210spcolor2') -
                            d1210spcolor2; //! =======> 👀
                        data.put('1210spcolor2',
                            valueDelete1210spColor2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt1210sp.clear();
                    dc2W1210sp.clear();
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
