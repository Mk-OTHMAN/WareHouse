import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef40pt extends StatefulWidget {
  const SellRef40pt({super.key});

  @override
  State<SellRef40pt> createState() => _SellRef40ptState();
}

class _SellRef40ptState extends State<SellRef40pt> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty40pt = 0;
    int valueDelete40ptColor1 = 0;
    int valueDelete40ptColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal40pt = 0;
    int d40ptcolor1 = 0;
    int d40ptcolor2 = 0;
    TextEditingController deletetotal40pt = TextEditingController();
    TextEditingController delete40ptcolor1 = TextEditingController();
    TextEditingController delete40ptcolor2 = TextEditingController();
    var dt40pt = deletetotal40pt;
    var dc1R40pt = delete40ptcolor1;
    var dc2R40pt = delete40ptcolor2;
    if (data.get('total40pt') == null) {
      data.put('total40pt', 0);
    }
    if (data.get('40ptcolor1') == null) {
      data.put('40ptcolor1', 0);
    }
    if (data.get('40ptcolor2') == null) {
      data.put('40ptcolor2', 0);
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
                        textController: deletetotal40pt)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'SL Quantity',
                        textController: delete40ptcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: component_buttom_sheet(
                        componentName: 'CH Quantity',
                        textController: delete40ptcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt40pt.text.isEmpty &&
                        dc1R40pt.text.isEmpty &&
                        dc2R40pt.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R40pt.text.isEmpty && dc2R40pt.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt40pt.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt40pt.text.isEmpty && dc2R40pt.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pt.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt40pt.text.isEmpty && dc1R40pt.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R40pt.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt40pt.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pt.clear();
                      dc2R40pt.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total40pt') == 0) {
                      //! =======> 👀 [total]

                      dtotal40pt = int.parse(deletetotal40pt.text);
                      if (dtotal40pt > data.get('total40pt')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt40pt.clear();
                        dc1R40pt.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('40ptcolor1') == 0 || d40ptcolor1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40ptcolor1 >
                              data.get('40ptcolor1') && //! =======> 👀 [color1]
                          data.get('40ptcolor1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R40pt.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('40ptcolor2') == 0 || d40ptcolor1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40ptcolor2 >
                              data.get('40ptcolor2') && //! =======> 👀 [color2]
                          data.get('40ptcolor2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt40pt.text.isNotEmpty &&
                        dc1R40pt.text.isNotEmpty &&
                        dc2R40pt.text.isNotEmpty) {
                      dtotal40pt = int.parse(dt40pt.text);
                      d40ptcolor1 = int.parse(dc1R40pt.text);
                      d40ptcolor2 = int.parse(dc2R40pt.text);
                      if (dtotal40pt >
                                  data.get(
                                      'total40pt') && //! =======> 👀 [total]
                              data.get('total40pt') >=
                                  0 || //! =======> 👀 [total]
                          d40ptcolor1 >
                                  data.get(
                                      '40ptcolor1') && //! =======> 👀 [color1]
                              data.get('40ptcolor1') >=
                                  0 || //! =======> 👀[color1]
                          d40ptcolor2 >
                                  data.get(
                                      '40ptcolor2') && //! =======> 👀 [color2]
                              data.get('40ptcolor2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pt.clear();
                        dc1R40pt.clear();
                        dc2R40pt.clear();
                      } else {
                        dtotal40pt = int.parse(dt40pt.text);
                        d40ptcolor1 = int.parse(dc1R40pt.text);
                        d40ptcolor2 = int.parse(dc2R40pt.text);
                        valueDeleteQuantaty40pt = data.get('total40pt') -
                            dtotal40pt; //! =======> 👀 [total]
                        data.put('total40pt',
                            valueDeleteQuantaty40pt); //! =======> 👀 [total]
                        valueDelete40ptColor1 = data.get('40ptcolor1') -
                            d40ptcolor1; //! =======> 👀 [color1]
                        data.put('40ptcolor1',
                            valueDelete40ptColor1); //! =======> 👀 [color1]
                        valueDelete40ptColor2 = data.get('40ptcolor2') -
                            d40ptcolor2; //! =======> 👀 [color2]
                        data.put('40ptcolor2',
                            valueDelete40ptColor2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt40pt.clear();
                        dc1R40pt.clear();
                        dc2R40pt.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R40pt.text.isEmpty) {
                      if (data.get('total40pt') > 0 || //! =======> 👀 [total]
                          data.get('40ptcolor1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal40pt = int.parse(dt40pt.text);
                        d40ptcolor1 = int.parse(dc1R40pt.text);

                        if (dtotal40pt >
                                data.get('total40pt') || //! =======> 👀 [total]
                            d40ptcolor1 > data.get('40ptcolor1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal40pt = int.parse(dt40pt.text);
                          d40ptcolor1 = int.parse(dc1R40pt.text);
                          valueDeleteQuantaty40pt = data.get('total40pt') -
                              dtotal40pt; //! =======> 👀 [total]
                          data.put('total40pt',
                              valueDeleteQuantaty40pt); //! =======> 👀 [total]

                          valueDelete40ptColor1 = data.get('40ptcolor1') -
                              d40ptcolor1; //! =======> 👀 [color1]
                          data.put('40ptcolor1',
                              valueDelete40ptColor1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt40pt.clear();
                      dc1R40pt.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R40pt.text.isEmpty) {
                      if (data.get('total40pt') > 0 || //! =======> 👀[total]
                          data.get('40ptcolor2') > 0) {
                        //! =======> 👀[color2]

                        dtotal40pt = int.parse(dt40pt.text);
                        d40ptcolor2 = int.parse(dc2R40pt.text);
                      }
                      if (dtotal40pt >
                              data.get('total40pt') || //! =======> 👀 [total]
                          d40ptcolor2 > data.get('40ptcolor2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pt.clear();
                        dc2R40pt.clear();
                      } else {
                        dtotal40pt = int.parse(dt40pt.text);
                        d40ptcolor2 = int.parse(dc2R40pt.text);
                        valueDeleteQuantaty40pt = data.get('total40pt') -
                            dtotal40pt; //! =======> 👀[total]
                        data.put('total40pt',
                            valueDeleteQuantaty40pt); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete40ptColor2 = data.get('40ptcolor2') -
                            d40ptcolor2; //! =======> 👀[color2]
                        data.put('40ptcolor2',
                            valueDelete40ptColor2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt40pt.clear();
                    dc2R40pt.clear();
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
