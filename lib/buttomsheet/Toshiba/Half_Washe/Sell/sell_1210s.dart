import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1210s extends StatefulWidget {
  const SellW1210s({super.key});

  @override
  State<SellW1210s> createState() => _SellW1210sState();
}

class _SellW1210sState extends State<SellW1210s> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1210s = 0;
    int valueDelete1210sColor1 = 0;
    int valueDelete1210sColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1210s = 0;
    int d1210scolor1 = 0;
    int d1210scolor2 = 0;
    TextEditingController deletetotal1210s = TextEditingController();
    TextEditingController delete1210scolor1 = TextEditingController();
    TextEditingController delete1210scolor2 = TextEditingController();
    var dt1210s = deletetotal1210s;
    var dc1W1210s = delete1210scolor1;
    var dc2W1210s = delete1210scolor2;
    if (data.get('total1210s') == null) {
      data.put('total1210s', 0);
    }
    if (data.get('1210scolor1') == null) {
      data.put('1210scolor1', 0);
    }
    if (data.get('1210scolor2') == null) {
      data.put('1210scolor2', 0);
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
                        textController: deletetotal1210s)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: delete1210scolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: delete1210scolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt1210s.text.isEmpty &&
                        dc1W1210s.text.isEmpty &&
                        dc2W1210s.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W1210s.text.isEmpty && dc2W1210s.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt1210s.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt1210s.text.isEmpty && dc2W1210s.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1210s.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt1210s.text.isEmpty && dc1W1210s.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W1210s.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt1210s.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1210s.clear();
                      dc2W1210s.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total1210s') == 0) {
                      //! =======> 👀
                      dtotal1210s = int.parse(deletetotal1210s.text);
                      if (dtotal1210s > data.get('total1210s')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt1210s.clear();
                        dc1W1210s.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('1210scolor1') == 0 || d1210scolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1210scolor1 >
                              data.get('1210scolor1') && //! =======> 👀
                          data.get('1210scolor1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W1210s.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('1210scolor2') == 0 || d1210scolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1210scolor2 >
                              data.get('1210scolor2') && //! =======> 👀
                          data.get('1210scolor2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt1210s.text.isNotEmpty &&
                        dc1W1210s.text.isNotEmpty &&
                        dc2W1210s.text.isNotEmpty) {
                      dtotal1210s = int.parse(dt1210s.text);
                      d1210scolor1 = int.parse(dc1W1210s.text);
                      d1210scolor2 = int.parse(dc2W1210s.text);
                      if (dtotal1210s >
                                  data.get('total1210s') && //! =======> 👀
                              data.get('total1210s') >= 0 || //! =======> 👀
                          d1210scolor1 >
                                  data.get('1210scolor1') && //! =======> 👀
                              data.get('1210scolor1') >= 0 || //! =======> 👀
                          d1210scolor2 >
                                  data.get('1210scolor2') && //! =======> 👀
                              data.get('1210scolor2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt1210s.clear();
                        dc1W1210s.clear();
                        dc2W1210s.clear();
                      } else {
                        dtotal1210s = int.parse(dt1210s.text);
                        d1210scolor1 = int.parse(dc1W1210s.text);
                        d1210scolor2 = int.parse(dc2W1210s.text);
                        valueDeleteQuantaty1210s = data.get('total1210s') -
                            dtotal1210s; //! =======> 👀
                        data.put('total1210s',
                            valueDeleteQuantaty1210s); //! =======> 👀
                        valueDelete1210sColor1 = data.get('1210scolor1') -
                            d1210scolor1; //! =======> 👀
                        data.put('1210scolor1',
                            valueDelete1210sColor1); //! =======> 👀
                        valueDelete1210sColor2 = data.get('1210scolor2') -
                            d1210scolor2; //! =======> 👀
                        data.put('1210scolor2',
                            valueDelete1210sColor2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt1210s.clear();
                        dc1W1210s.clear();
                        dc2W1210s.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W1210s.text.isEmpty) {
                      if (data.get('total1210s') > 0 || //! =======> 👀
                          data.get('1210scolor1') > 0) {
                        //! =======> 👀
                        dtotal1210s = int.parse(dt1210s.text);
                        d1210scolor1 = int.parse(dc1W1210s.text);

                        if (dtotal1210s >
                                data.get('total1210s') || //! =======> 👀
                            d1210scolor1 > data.get('1210scolor1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal1210s = int.parse(dt1210s.text);
                          d1210scolor1 = int.parse(dc1W1210s.text);
                          valueDeleteQuantaty1210s = data.get('total1210s') -
                              dtotal1210s; //! =======> 👀
                          data.put('total1210s',
                              valueDeleteQuantaty1210s); //! =======> 👀

                          valueDelete1210sColor1 = data.get('1210scolor1') -
                              d1210scolor1; //! =======> 👀
                          data.put('1210scolor1',
                              valueDelete1210sColor1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt1210s.clear();
                      dc1W1210s.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W1210s.text.isEmpty) {
                      if (data.get('total1210s') > 0 || //! =======> 👀
                          data.get('1210scolor2') > 0) {
                        //! =======> 👀
                        dtotal1210s = int.parse(dt1210s.text);
                        d1210scolor2 = int.parse(dc2W1210s.text);
                      }
                      if (dtotal1210s >
                              data.get('total1210s') || //! =======> 👀
                          d1210scolor2 > data.get('1210scolor2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt1210s.clear();
                        dc2W1210s.clear();
                      } else {
                        dtotal1210s = int.parse(dt1210s.text);
                        d1210scolor2 = int.parse(dc2W1210s.text);
                        valueDeleteQuantaty1210s = data.get('total1210s') -
                            dtotal1210s; //! =======> 👀
                        data.put('total1210s',
                            valueDeleteQuantaty1210s); //! =======> 👀
                        // dt18.clear();

                        valueDelete1210sColor2 = data.get('1210scolor2') -
                            d1210scolor2; //! =======> 👀
                        data.put('1210scolor2',
                            valueDelete1210sColor2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt1210s.clear();
                    dc2W1210s.clear();
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
