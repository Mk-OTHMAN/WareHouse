import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1000p extends StatefulWidget {
  const SellW1000p({super.key});

  @override
  State<SellW1000p> createState() => _SellW1000pState();
}

class _SellW1000pState extends State<SellW1000p> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1000p = 0;
    int valueDelete1000pColor1 = 0;
    int valueDelete1000pColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1000p = 0;
    int d1000pcolor1 = 0;
    int d1000pcolor2 = 0;
    TextEditingController deletetotal1000p = TextEditingController();
    TextEditingController delete1000pcolor1 = TextEditingController();
    TextEditingController delete1000pcolor2 = TextEditingController();
    var dt1000p = deletetotal1000p;
    var dc1W1000p = delete1000pcolor1;
    var dc2W1000p = delete1000pcolor2;
    if (data.get('total1000p') == null) {
      data.put('total1000p', 0);
    }
    if (data.get('1000pcolor1') == null) {
      data.put('1000pcolor1', 0);
    }
    if (data.get('1000pcolor2') == null) {
      data.put('1000pcolor2', 0);
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
                    child: component_buttom_sheet(
                        componentName: 'Total Quantity',
                        textController: deletetotal1000p)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'SL Quantity',
                        textController: delete1000pcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'CH Quantity',
                        textController: delete1000pcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt1000p.text.isEmpty &&
                        dc1W1000p.text.isEmpty &&
                        dc2W1000p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W1000p.text.isEmpty && dc2W1000p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt1000p.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt1000p.text.isEmpty && dc2W1000p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1000p.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt1000p.text.isEmpty && dc1W1000p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W1000p.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt1000p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1000p.clear();
                      dc2W1000p.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total1000p') == 0) {
                      //! =======> 👀
                      dtotal1000p = int.parse(deletetotal1000p.text);
                      if (dtotal1000p > data.get('total1000p')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt1000p.clear();
                        dc1W1000p.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('1000pcolor1') == 0 || d1000pcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1000pcolor1 >
                              data.get('1000pcolor1') && //! =======> 👀
                          data.get('1000pcolor1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W1000p.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('1000pcolor2') == 0 || d1000pcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1000pcolor2 >
                              data.get('1000pcolor2') && //! =======> 👀
                          data.get('1000pcolor2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt1000p.text.isNotEmpty &&
                        dc1W1000p.text.isNotEmpty &&
                        dc2W1000p.text.isNotEmpty) {
                      dtotal1000p = int.parse(dt1000p.text);
                      d1000pcolor1 = int.parse(dc1W1000p.text);
                      d1000pcolor2 = int.parse(dc2W1000p.text);
                      if (dtotal1000p >
                                  data.get('total1000p') && //! =======> 👀
                              data.get('total1000p') >= 0 || //! =======> 👀
                          d1000pcolor1 >
                                  data.get('1000pcolor1') && //! =======> 👀
                              data.get('1000pcolor1') >= 0 || //! =======> 👀
                          d1000pcolor2 >
                                  data.get('1000pcolor2') && //! =======> 👀
                              data.get('1000pcolor2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt1000p.clear();
                        dc1W1000p.clear();
                        dc2W1000p.clear();
                      } else {
                        dtotal1000p = int.parse(dt1000p.text);
                        d1000pcolor1 = int.parse(dc1W1000p.text);
                        d1000pcolor2 = int.parse(dc2W1000p.text);
                        valueDeleteQuantaty1000p = data.get('total1000p') -
                            dtotal1000p; //! =======> 👀
                        data.put('total1000p',
                            valueDeleteQuantaty1000p); //! =======> 👀
                        valueDelete1000pColor1 = data.get('1000pcolor1') -
                            d1000pcolor1; //! =======> 👀
                        data.put('1000pcolor1',
                            valueDelete1000pColor1); //! =======> 👀
                        valueDelete1000pColor2 = data.get('1000pcolor2') -
                            d1000pcolor2; //! =======> 👀
                        data.put('1000pcolor2',
                            valueDelete1000pColor2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt1000p.clear();
                        dc1W1000p.clear();
                        dc2W1000p.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W1000p.text.isEmpty) {
                      if (data.get('total1000p') > 0 || //! =======> 👀
                          data.get('1000pcolor1') > 0) {
                        //! =======> 👀
                        dtotal1000p = int.parse(dt1000p.text);
                        d1000pcolor1 = int.parse(dc1W1000p.text);

                        if (dtotal1000p >
                                data.get('total1000p') || //! =======> 👀
                            d1000pcolor1 > data.get('1000pcolor1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal1000p = int.parse(dt1000p.text);
                          d1000pcolor1 = int.parse(dc1W1000p.text);
                          valueDeleteQuantaty1000p = data.get('total1000p') -
                              dtotal1000p; //! =======> 👀
                          data.put('total1000p',
                              valueDeleteQuantaty1000p); //! =======> 👀

                          valueDelete1000pColor1 = data.get('1000pcolor1') -
                              d1000pcolor1; //! =======> 👀
                          data.put('1000pcolor1',
                              valueDelete1000pColor1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt1000p.clear();
                      dc1W1000p.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W1000p.text.isEmpty) {
                      if (data.get('total1000p') > 0 || //! =======> 👀
                          data.get('1000pcolor2') > 0) {
                        //! =======> 👀
                        dtotal1000p = int.parse(dt1000p.text);
                        d1000pcolor2 = int.parse(dc2W1000p.text);
                      }
                      if (dtotal1000p >
                              data.get('total1000p') || //! =======> 👀
                          d1000pcolor2 > data.get('1000pcolor2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt1000p.clear();
                        dc2W1000p.clear();
                      } else {
                        dtotal1000p = int.parse(dt1000p.text);
                        d1000pcolor2 = int.parse(dc2W1000p.text);
                        valueDeleteQuantaty1000p = data.get('total1000p') -
                            dtotal1000p; //! =======> 👀
                        data.put('total1000p',
                            valueDeleteQuantaty1000p); //! =======> 👀
                        // dt18.clear();

                        valueDelete1000pColor2 = data.get('1000pcolor2') -
                            d1000pcolor2; //! =======> 👀
                        data.put('1000pcolor2',
                            valueDelete1000pColor2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt1000p.clear();
                    dc2W1000p.clear();
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
