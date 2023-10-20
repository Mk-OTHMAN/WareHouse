import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW720P extends StatefulWidget {
  const SellW720P({super.key});

  @override
  State<SellW720P> createState() => _SellW720PState();
}

class _SellW720PState extends State<SellW720P> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty720p = 0;
    int valueDelete720pColor1 = 0;
    int valueDelete720pColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal720p = 0;
    int d720pcolor1 = 0;
    int d720pcolor2 = 0;
    TextEditingController deletetotal720p = TextEditingController();
    TextEditingController delete720pcolor1 = TextEditingController();
    TextEditingController delete720pcolor2 = TextEditingController();
    var dt720p = deletetotal720p;
    var dc1W720p = delete720pcolor1;
    var dc2W720p = delete720pcolor2;
    if (data.get('total720p') == null) {
      data.put('total720p', 0);
    }
    if (data.get('720pcolor1') == null) {
      data.put('720pcolor1', 0);
    }
    if (data.get('720pcolor2') == null) {
      data.put('720pcolor2', 0);
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
                        textController: deletetotal720p)),
                //!  ________  sl quantity  ___________
                Expanded(

                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: delete720pcolor1)),
                //! ______________  ch quantity  __________
                Expanded(

                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: delete720pcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt720p.text.isEmpty &&
                        dc1W720p.text.isEmpty &&
                        dc2W720p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W720p.text.isEmpty && dc2W720p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt720p.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt720p.text.isEmpty && dc2W720p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W720p.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt720p.text.isEmpty && dc1W720p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W720p.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt720p.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W720p.clear();
                      dc2W720p.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total720p') == 0) {
                      //! =======> 👀
                      dtotal720p = int.parse(deletetotal720p.text);
                      if (dtotal720p > data.get('total720p')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt720p.clear();
                        dc1W720p.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('720pcolor1') == 0 || d720pcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d720pcolor1 >
                              data.get('720pcolor1') && //! =======> 👀
                          data.get('720pcolor1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W720p.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('720pcolor2') == 0 || d720pcolor1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d720pcolor2 >
                              data.get('720pcolor2') && //! =======> 👀
                          data.get('720pcolor2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt720p.text.isNotEmpty &&
                        dc1W720p.text.isNotEmpty &&
                        dc2W720p.text.isNotEmpty) {
                      dtotal720p = int.parse(dt720p.text);
                      d720pcolor1 = int.parse(dc1W720p.text);
                      d720pcolor2 = int.parse(dc2W720p.text);
                      if (dtotal720p > data.get('total720p') && //! =======> 👀
                              data.get('total720p') >= 0 || //! =======> 👀
                          d720pcolor1 >
                                  data.get('720pcolor1') && //! =======> 👀
                              data.get('720pcolor1') >= 0 || //! =======> 👀
                          d720pcolor2 >
                                  data.get('720pcolor2') && //! =======> 👀
                              data.get('720pcolor2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt720p.clear();
                        dc1W720p.clear();
                        dc2W720p.clear();
                      } else {
                        dtotal720p = int.parse(dt720p.text);
                        d720pcolor1 = int.parse(dc1W720p.text);
                        d720pcolor2 = int.parse(dc2W720p.text);
                        valueDeleteQuantaty720p =
                            data.get('total720p') - dtotal720p; //! =======> 👀
                        data.put('total720p',
                            valueDeleteQuantaty720p); //! =======> 👀
                        valueDelete720pColor1 = data.get('720pcolor1') -
                            d720pcolor1; //! =======> 👀
                        data.put('720pcolor1',
                            valueDelete720pColor1); //! =======> 👀
                        valueDelete720pColor2 = data.get('720pcolor2') -
                            d720pcolor2; //! =======> 👀
                        data.put('720pcolor2',
                            valueDelete720pColor2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt720p.clear();
                        dc1W720p.clear();
                        dc2W720p.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W720p.text.isEmpty) {
                      if (data.get('total720p') > 0 || //! =======> 👀
                          data.get('720pcolor1') > 0) {
                        //! =======> 👀
                        dtotal720p = int.parse(dt720p.text);
                        d720pcolor1 = int.parse(dc1W720p.text);

                        if (dtotal720p >
                                data.get('total720p') || //! =======> 👀
                            d720pcolor1 > data.get('720pcolor1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal720p = int.parse(dt720p.text);
                          d720pcolor1 = int.parse(dc1W720p.text);
                          valueDeleteQuantaty720p = data.get('total720p') -
                              dtotal720p; //! =======> 👀
                          data.put('total720p',
                              valueDeleteQuantaty720p); //! =======> 👀

                          valueDelete720pColor1 = data.get('720pcolor1') -
                              d720pcolor1; //! =======> 👀
                          data.put('720pcolor1',
                              valueDelete720pColor1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt720p.clear();
                      dc1W720p.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W720p.text.isEmpty) {
                      if (data.get('total720p') > 0 || //! =======> 👀
                          data.get('720pcolor2') > 0) {
                        //! =======> 👀
                        dtotal720p = int.parse(dt720p.text);
                        d720pcolor2 = int.parse(dc2W720p.text);
                      }
                      if (dtotal720p > data.get('total720p') || //! =======> 👀
                          d720pcolor2 > data.get('720pcolor2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt720p.clear();
                        dc2W720p.clear();
                      } else {
                        dtotal720p = int.parse(dt720p.text);
                        d720pcolor2 = int.parse(dc2W720p.text);
                        valueDeleteQuantaty720p =
                            data.get('total720p') - dtotal720p; //! =======> 👀
                        data.put('total720p',
                            valueDeleteQuantaty720p); //! =======> 👀
                        // dt18.clear();

                        valueDelete720pColor2 = data.get('720pcolor2') -
                            d720pcolor2; //! =======> 👀
                        data.put('720pcolor2',
                            valueDelete720pColor2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt720p.clear();
                    dc2W720p.clear();
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
