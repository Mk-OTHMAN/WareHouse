import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellToshiba33T extends StatefulWidget {
  const SellToshiba33T({super.key});

  @override
  State<SellToshiba33T> createState() => _SellToshiba33TState();
}

class _SellToshiba33TState extends State<SellToshiba33T> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty33T = 0;
    int valueDelete33TColor1 = 0;
    int valueDelete33TColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal33T = 0;
    int d33Tcolor1 = 0;
    int d33Tcolor2 = 0;
    TextEditingController deletetotal33T = TextEditingController();
    TextEditingController delete33Tcolor1 = TextEditingController();
    TextEditingController delete33Tcolor2 = TextEditingController();
    var dt33T = deletetotal33T;
    var dc1R33T = delete33Tcolor1;
    var dc2R33T = delete33Tcolor2;
    if (data.get('total33T') == null) {
      data.put('total33T', 0);
    }
    if (data.get('33Tcolor1') == null) {
      data.put('33Tcolor1', 0);
    }
    if (data.get('33Tcolor2') == null) {
      data.put('33Tcolor2', 0);
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
                        textController: deletetotal33T)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'SL Quantity',
                        textController: delete33Tcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'CH Quantity',
                        textController: delete33Tcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt33T.text.isEmpty &&
                        dc1R33T.text.isEmpty &&
                        dc2R33T.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R33T.text.isEmpty && dc2R33T.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt33T.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt33T.text.isEmpty && dc2R33T.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R33T.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt33T.text.isEmpty && dc1R33T.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R33T.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt33T.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R33T.clear();
                      dc2R33T.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total33T') == 0) {
                      //! =======> 👀
                      dtotal33T = int.parse(deletetotal33T.text);
                      if (dtotal33T > data.get('total33T')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt33T.clear();
                        dc1R33T.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('33Tcolor1') == 0 || d33Tcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d33Tcolor1 > data.get('33Tcolor1') && //! =======> 👀
                          data.get('33Tcolor1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R33T.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('33Tcolor2') == 0 || d33Tcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d33Tcolor2 > data.get('33Tcolor2') && //! =======> 👀
                          data.get('33Tcolor2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt33T.text.isNotEmpty &&
                        dc1R33T.text.isNotEmpty &&
                        dc2R33T.text.isNotEmpty) {
                      dtotal33T = int.parse(dt33T.text);
                      d33Tcolor1 = int.parse(dc1R33T.text);
                      d33Tcolor2 = int.parse(dc2R33T.text);
                      if (dtotal33T > data.get('total33T') && //! =======> 👀
                              data.get('total33T') >= 0 || //! =======> 👀
                          d33Tcolor1 > data.get('33Tcolor1') && //! =======> 👀
                              data.get('33Tcolor1') >= 0 || //! =======> 👀
                          d33Tcolor2 > data.get('33Tcolor2') && //! =======> 👀
                              data.get('33Tcolor2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt33T.clear();
                        dc1R33T.clear();
                        dc2R33T.clear();
                      } else {
                        dtotal33T = int.parse(dt33T.text);
                        d33Tcolor1 = int.parse(dc1R33T.text);
                        d33Tcolor2 = int.parse(dc2R33T.text);
                        valueDeleteQuantaty33T =
                            data.get('total33T') - dtotal33T; //! =======> 👀
                        data.put(
                            'total33T', valueDeleteQuantaty33T); //! =======> 👀
                        valueDelete33TColor1 =
                            data.get('33Tcolor1') - d33Tcolor1; //! =======> 👀
                        data.put(
                            '33Tcolor1', valueDelete33TColor1); //! =======> 👀
                        valueDelete33TColor2 =
                            data.get('33Tcolor2') - d33Tcolor2; //! =======> 👀
                        data.put(
                            '33Tcolor2', valueDelete33TColor2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt33T.clear();
                        dc1R33T.clear();
                        dc2R33T.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R33T.text.isEmpty) {
                      if (data.get('total33T') > 0 || //! =======> 👀
                          data.get('33Tcolor1') > 0) {
                        //! =======> 👀
                        dtotal33T = int.parse(dt33T.text);
                        d33Tcolor1 = int.parse(dc1R33T.text);

                        if (dtotal33T > data.get('total33T') || //! =======> 👀
                            d33Tcolor1 > data.get('33Tcolor1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal33T = int.parse(dt33T.text);
                          d33Tcolor1 = int.parse(dc1R33T.text);
                          valueDeleteQuantaty33T =
                              data.get('total33T') - dtotal33T; //! =======> 👀
                          data.put('total33T',
                              valueDeleteQuantaty33T); //! =======> 👀

                          valueDelete33TColor1 = data.get('33Tcolor1') -
                              d33Tcolor1; //! =======> 👀
                          data.put('33Tcolor1',
                              valueDelete33TColor1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt33T.clear();
                      dc1R33T.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R33T.text.isEmpty) {
                      if (data.get('total33T') > 0 || //! =======> 👀
                          data.get('33Tcolor2') > 0) {
                        //! =======> 👀
                        dtotal33T = int.parse(dt33T.text);
                        d33Tcolor2 = int.parse(dc2R33T.text);
                      }
                      if (dtotal33T > data.get('total33T') || //! =======> 👀
                          d33Tcolor2 > data.get('33Tcolor2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt33T.clear();
                        dc2R33T.clear();
                      } else {
                        dtotal33T = int.parse(dt33T.text);
                        d33Tcolor2 = int.parse(dc2R33T.text);
                        valueDeleteQuantaty33T =
                            data.get('total33T') - dtotal33T; //! =======> 👀
                        data.put(
                            'total33T', valueDeleteQuantaty33T); //! =======> 👀
                        // dt18.clear();

                        valueDelete33TColor2 =
                            data.get('33Tcolor2') - d33Tcolor2; //! =======> 👀
                        data.put(
                            '33Tcolor2', valueDelete33TColor2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt33T.clear();
                    dc2R33T.clear();
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
