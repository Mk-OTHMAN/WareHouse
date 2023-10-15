import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef40pj extends StatefulWidget {
  const SellRef40pj({super.key});

  @override
  State<SellRef40pj> createState() => _SellRef40pjState();
}

class _SellRef40pjState extends State<SellRef40pj> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty40pj = 0;
    int valueDelete40pjColor1 = 0;
    int valueDelete40pjColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal40pj = 0;
    int d40pjcolor1 = 0;
    int d40pjcolor2 = 0;
    TextEditingController deletetotal40pj = TextEditingController();
    TextEditingController delete40pjcolor1 = TextEditingController();
    TextEditingController delete40pjcolor2 = TextEditingController();
    var dt40pj = deletetotal40pj;
    var dc1R40pj = delete40pjcolor1;
    var dc2R40pj = delete40pjcolor2;
    if (data.get('total40pj') == null) {
      data.put('total40pj', 0);
    }
    if (data.get('40pjcolor1') == null) {
      data.put('40pjcolor1', 0);
    }
    if (data.get('40pjcolor2') == null) {
      data.put('40pjcolor2', 0);
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
                        textController: deletetotal40pj)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'SL Quantity',
                        textController: delete40pjcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'CH Quantity',
                        textController: delete40pjcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt40pj.text.isEmpty &&
                        dc1R40pj.text.isEmpty &&
                        dc2R40pj.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R40pj.text.isEmpty && dc2R40pj.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt40pj.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt40pj.text.isEmpty && dc2R40pj.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pj.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt40pj.text.isEmpty && dc1R40pj.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R40pj.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt40pj.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pj.clear();
                      dc2R40pj.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total40pj') == 0) {
                      //! =======> 👀 [total]

                      dtotal40pj = int.parse(deletetotal40pj.text);
                      if (dtotal40pj > data.get('total40pj')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt40pj.clear();
                        dc1R40pj.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('40pjcolor1') == 0 || d40pjcolor1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40pjcolor1 >
                              data.get('40pjcolor1') && //! =======> 👀 [color1]
                          data.get('40pjcolor1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R40pj.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('40pjcolor2') == 0 || d40pjcolor1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40pjcolor2 >
                              data.get('40pjcolor2') && //! =======> 👀 [color2]
                          data.get('40pjcolor2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt40pj.text.isNotEmpty &&
                        dc1R40pj.text.isNotEmpty &&
                        dc2R40pj.text.isNotEmpty) {
                      dtotal40pj = int.parse(dt40pj.text);
                      d40pjcolor1 = int.parse(dc1R40pj.text);
                      d40pjcolor2 = int.parse(dc2R40pj.text);
                      if (dtotal40pj >
                                  data.get(
                                      'total40pj') && //! =======> 👀 [total]
                              data.get('total40pj') >=
                                  0 || //! =======> 👀 [total]
                          d40pjcolor1 >
                                  data.get(
                                      '40pjcolor1') && //! =======> 👀 [color1]
                              data.get('40pjcolor1') >=
                                  0 || //! =======> 👀[color1]
                          d40pjcolor2 >
                                  data.get(
                                      '40pjcolor2') && //! =======> 👀 [color2]
                              data.get('40pjcolor2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pj.clear();
                        dc1R40pj.clear();
                        dc2R40pj.clear();
                      } else {
                        dtotal40pj = int.parse(dt40pj.text);
                        d40pjcolor1 = int.parse(dc1R40pj.text);
                        d40pjcolor2 = int.parse(dc2R40pj.text);
                        valueDeleteQuantaty40pj = data.get('total40pj') -
                            dtotal40pj; //! =======> 👀 [total]
                        data.put('total40pj',
                            valueDeleteQuantaty40pj); //! =======> 👀 [total]
                        valueDelete40pjColor1 = data.get('40pjcolor1') -
                            d40pjcolor1; //! =======> 👀 [color1]
                        data.put('40pjcolor1',
                            valueDelete40pjColor1); //! =======> 👀 [color1]
                        valueDelete40pjColor2 = data.get('40pjcolor2') -
                            d40pjcolor2; //! =======> 👀 [color2]
                        data.put('40pjcolor2',
                            valueDelete40pjColor2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt40pj.clear();
                        dc1R40pj.clear();
                        dc2R40pj.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R40pj.text.isEmpty) {
                      if (data.get('total40pj') > 0 || //! =======> 👀 [total]
                          data.get('40pjcolor1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal40pj = int.parse(dt40pj.text);
                        d40pjcolor1 = int.parse(dc1R40pj.text);

                        if (dtotal40pj >
                                data.get('total40pj') || //! =======> 👀 [total]
                            d40pjcolor1 > data.get('40pjcolor1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal40pj = int.parse(dt40pj.text);
                          d40pjcolor1 = int.parse(dc1R40pj.text);
                          valueDeleteQuantaty40pj = data.get('total40pj') -
                              dtotal40pj; //! =======> 👀 [total]
                          data.put('total40pj',
                              valueDeleteQuantaty40pj); //! =======> 👀 [total]

                          valueDelete40pjColor1 = data.get('40pjcolor1') -
                              d40pjcolor1; //! =======> 👀 [color1]
                          data.put('40pjcolor1',
                              valueDelete40pjColor1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt40pj.clear();
                      dc1R40pj.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R40pj.text.isEmpty) {
                      if (data.get('total40pj') > 0 || //! =======> 👀[total]
                          data.get('40pjcolor2') > 0) {
                        //! =======> 👀[color2]

                        dtotal40pj = int.parse(dt40pj.text);
                        d40pjcolor2 = int.parse(dc2R40pj.text);
                      }
                      if (dtotal40pj >
                              data.get('total40pj') || //! =======> 👀 [total]
                          d40pjcolor2 > data.get('40pjcolor2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pj.clear();
                        dc2R40pj.clear();
                      } else {
                        dtotal40pj = int.parse(dt40pj.text);
                        d40pjcolor2 = int.parse(dc2R40pj.text);
                        valueDeleteQuantaty40pj = data.get('total40pj') -
                            dtotal40pj; //! =======> 👀[total]
                        data.put('total40pj',
                            valueDeleteQuantaty40pj); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete40pjColor2 = data.get('40pjcolor2') -
                            d40pjcolor2; //! =======> 👀[color2]
                        data.put('40pjcolor2',
                            valueDelete40pjColor2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt40pj.clear();
                    dc2R40pj.clear();
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
