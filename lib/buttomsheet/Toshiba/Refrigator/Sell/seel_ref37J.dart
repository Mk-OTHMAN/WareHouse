import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef37J extends StatefulWidget {
  const SellRef37J({super.key});

  @override
  State<SellRef37J> createState() => _SellRef37JState();
}

class _SellRef37JState extends State<SellRef37J> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty37J = 0;
    int valueDelete37JColor1 = 0;
    int valueDelete37JColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal37J = 0;
    int d37Jcolor1 = 0;
    int d37Jcolor2 = 0;
    TextEditingController deletetotal37J = TextEditingController();
    TextEditingController delete37Jcolor1 = TextEditingController();
    TextEditingController delete37Jcolor2 = TextEditingController();
    var dt37J = deletetotal37J;
    var dc1R37J = delete37Jcolor1;
    var dc2R37J = delete37Jcolor2;
    if (data.get('total37J') == null) {
      data.put('total37J', 0);
    }
    if (data.get('37Jcolor1') == null) {
      data.put('37Jcolor1', 0);
    }
    if (data.get('37Jcolor2') == null) {
      data.put('37Jcolor2', 0);
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
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'Total Quantity',
                        textController: deletetotal37J)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'SL Quantity',
                        textController: delete37Jcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'CH Quantity',
                        textController: delete37Jcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt37J.text.isEmpty &&
                        dc1R37J.text.isEmpty &&
                        dc2R37J.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R37J.text.isEmpty && dc2R37J.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt37J.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt37J.text.isEmpty && dc2R37J.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R37J.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt37J.text.isEmpty && dc1R37J.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R37J.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt37J.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R37J.clear();
                      dc2R37J.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total37J') == 0) {
                      //! =======> 👀 [total]

                      dtotal37J = int.parse(deletetotal37J.text);
                      if (dtotal37J > data.get('total37J')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt37J.clear();
                        dc1R37J.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('37Jcolor1') == 0 || d37Jcolor1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d37Jcolor1 >
                              data.get('37Jcolor1') && //! =======> 👀 [color1]
                          data.get('37Jcolor1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R37J.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('37Jcolor2') == 0 || d37Jcolor1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d37Jcolor2 >
                              data.get('37Jcolor2') && //! =======> 👀 [color2]
                          data.get('37Jcolor2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt37J.text.isNotEmpty &&
                        dc1R37J.text.isNotEmpty &&
                        dc2R37J.text.isNotEmpty) {
                      dtotal37J = int.parse(dt37J.text);
                      d37Jcolor1 = int.parse(dc1R37J.text);
                      d37Jcolor2 = int.parse(dc2R37J.text);
                      if (dtotal37J >
                                  data.get(
                                      'total37J') && //! =======> 👀 [total]
                              data.get('total37J') >=
                                  0 || //! =======> 👀 [total]
                          d37Jcolor1 >
                                  data.get(
                                      '37Jcolor1') && //! =======> 👀 [color1]
                              data.get('37Jcolor1') >=
                                  0 || //! =======> 👀[color1]
                          d37Jcolor2 >
                                  data.get(
                                      '37Jcolor2') && //! =======> 👀 [color2]
                              data.get('37Jcolor2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt37J.clear();
                        dc1R37J.clear();
                        dc2R37J.clear();
                      } else {
                        dtotal37J = int.parse(dt37J.text);
                        d37Jcolor1 = int.parse(dc1R37J.text);
                        d37Jcolor2 = int.parse(dc2R37J.text);
                        valueDeleteQuantaty37J = data.get('total37J') -
                            dtotal37J; //! =======> 👀 [total]
                        data.put('total37J',
                            valueDeleteQuantaty37J); //! =======> 👀 [total]
                        valueDelete37JColor1 = data.get('37Jcolor1') -
                            d37Jcolor1; //! =======> 👀 [color1]
                        data.put('37Jcolor1',
                            valueDelete37JColor1); //! =======> 👀 [color1]
                        valueDelete37JColor2 = data.get('37Jcolor2') -
                            d37Jcolor2; //! =======> 👀 [color2]
                        data.put('37Jcolor2',
                            valueDelete37JColor2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt37J.clear();
                        dc1R37J.clear();
                        dc2R37J.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R37J.text.isEmpty) {
                      if (data.get('total37J') > 0 || //! =======> 👀 [total]
                          data.get('37Jcolor1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal37J = int.parse(dt37J.text);
                        d37Jcolor1 = int.parse(dc1R37J.text);

                        if (dtotal37J >
                                data.get('total37J') || //! =======> 👀 [total]
                            d37Jcolor1 > data.get('37Jcolor1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal37J = int.parse(dt37J.text);
                          d37Jcolor1 = int.parse(dc1R37J.text);
                          valueDeleteQuantaty37J = data.get('total37J') -
                              dtotal37J; //! =======> 👀 [total]
                          data.put('total37J',
                              valueDeleteQuantaty37J); //! =======> 👀 [total]

                          valueDelete37JColor1 = data.get('37Jcolor1') -
                              d37Jcolor1; //! =======> 👀 [color1]
                          data.put('37Jcolor1',
                              valueDelete37JColor1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt37J.clear();
                      dc1R37J.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R37J.text.isEmpty) {
                      if (data.get('total37J') > 0 || //! =======> 👀[total]
                          data.get('37Jcolor2') > 0) {
                        //! =======> 👀[color2]

                        dtotal37J = int.parse(dt37J.text);
                        d37Jcolor2 = int.parse(dc2R37J.text);
                      }
                      if (dtotal37J >
                              data.get('total37J') || //! =======> 👀 [total]
                          d37Jcolor2 > data.get('37Jcolor2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt37J.clear();
                        dc2R37J.clear();
                      } else {
                        dtotal37J = int.parse(dt37J.text);
                        d37Jcolor2 = int.parse(dc2R37J.text);
                        valueDeleteQuantaty37J = data.get('total37J') -
                            dtotal37J; //! =======> 👀[total]
                        data.put('total37J',
                            valueDeleteQuantaty37J); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete37JColor2 = data.get('37Jcolor2') -
                            d37Jcolor2; //! =======> 👀[color2]
                        data.put('37Jcolor2',
                            valueDelete37JColor2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt37J.clear();
                    dc2R37J.clear();
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
