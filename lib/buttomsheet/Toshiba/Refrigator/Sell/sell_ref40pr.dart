import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef40pr extends StatefulWidget {
  const SellRef40pr({super.key});

  @override
  State<SellRef40pr> createState() => _SellRef40prState();
}

class _SellRef40prState extends State<SellRef40pr> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty40pr = 0;
    int valueDelete40prColor1 = 0;
    int valueDelete40prColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal40pr = 0;
    int d40prcolor1 = 0;
    int d40prcolor2 = 0;
    TextEditingController deletetotal40pr = TextEditingController();
    TextEditingController delete40prcolor1 = TextEditingController();
    TextEditingController delete40prcolor2 = TextEditingController();
    var dt40pr = deletetotal40pr;
    var dc1R40pr = delete40prcolor1;
    var dc2R40pr = delete40prcolor2;
    if (data.get('total40pr') == null) {
      data.put('total40pr', 0);
    }
    if (data.get('40prcolor1') == null) {
      data.put('40prcolor1', 0);
    }
    if (data.get('40prcolor2') == null) {
      data.put('40prcolor2', 0);
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
                        textController: deletetotal40pr)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: delete40prcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: delete40prcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt40pr.text.isEmpty &&
                        dc1R40pr.text.isEmpty &&
                        dc2R40pr.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R40pr.text.isEmpty && dc2R40pr.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt40pr.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt40pr.text.isEmpty && dc2R40pr.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pr.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt40pr.text.isEmpty && dc1R40pr.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R40pr.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt40pr.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40pr.clear();
                      dc2R40pr.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total40pr') == 0) {
                      //! =======> 👀 [total]

                      dtotal40pr = int.parse(deletetotal40pr.text);
                      if (dtotal40pr > data.get('total40pr')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt40pr.clear();
                        dc1R40pr.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('40prcolor1') == 0 || d40prcolor1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40prcolor1 >
                              data.get('40prcolor1') && //! =======> 👀 [color1]
                          data.get('40prcolor1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R40pr.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('40prcolor2') == 0 || d40prcolor1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40prcolor2 >
                              data.get('40prcolor2') && //! =======> 👀 [color2]
                          data.get('40prcolor2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt40pr.text.isNotEmpty &&
                        dc1R40pr.text.isNotEmpty &&
                        dc2R40pr.text.isNotEmpty) {
                      dtotal40pr = int.parse(dt40pr.text);
                      d40prcolor1 = int.parse(dc1R40pr.text);
                      d40prcolor2 = int.parse(dc2R40pr.text);
                      if (dtotal40pr >
                                  data.get(
                                      'total40pr') && //! =======> 👀 [total]
                              data.get('total40pr') >=
                                  0 || //! =======> 👀 [total]
                          d40prcolor1 >
                                  data.get(
                                      '40prcolor1') && //! =======> 👀 [color1]
                              data.get('40prcolor1') >=
                                  0 || //! =======> 👀[color1]
                          d40prcolor2 >
                                  data.get(
                                      '40prcolor2') && //! =======> 👀 [color2]
                              data.get('40prcolor2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pr.clear();
                        dc1R40pr.clear();
                        dc2R40pr.clear();
                      } else {
                        dtotal40pr = int.parse(dt40pr.text);
                        d40prcolor1 = int.parse(dc1R40pr.text);
                        d40prcolor2 = int.parse(dc2R40pr.text);
                        valueDeleteQuantaty40pr = data.get('total40pr') -
                            dtotal40pr; //! =======> 👀 [total]
                        data.put('total40pr',
                            valueDeleteQuantaty40pr); //! =======> 👀 [total]
                        valueDelete40prColor1 = data.get('40prcolor1') -
                            d40prcolor1; //! =======> 👀 [color1]
                        data.put('40prcolor1',
                            valueDelete40prColor1); //! =======> 👀 [color1]
                        valueDelete40prColor2 = data.get('40prcolor2') -
                            d40prcolor2; //! =======> 👀 [color2]
                        data.put('40prcolor2',
                            valueDelete40prColor2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt40pr.clear();
                        dc1R40pr.clear();
                        dc2R40pr.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R40pr.text.isEmpty) {
                      if (data.get('total40pr') > 0 || //! =======> 👀 [total]
                          data.get('40prcolor1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal40pr = int.parse(dt40pr.text);
                        d40prcolor1 = int.parse(dc1R40pr.text);

                        if (dtotal40pr >
                                data.get('total40pr') || //! =======> 👀 [total]
                            d40prcolor1 > data.get('40prcolor1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal40pr = int.parse(dt40pr.text);
                          d40prcolor1 = int.parse(dc1R40pr.text);
                          valueDeleteQuantaty40pr = data.get('total40pr') -
                              dtotal40pr; //! =======> 👀 [total]
                          data.put('total40pr',
                              valueDeleteQuantaty40pr); //! =======> 👀 [total]

                          valueDelete40prColor1 = data.get('40prcolor1') -
                              d40prcolor1; //! =======> 👀 [color1]
                          data.put('40prcolor1',
                              valueDelete40prColor1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt40pr.clear();
                      dc1R40pr.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R40pr.text.isEmpty) {
                      if (data.get('total40pr') > 0 || //! =======> 👀[total]
                          data.get('40prcolor2') > 0) {
                        //! =======> 👀[color2]

                        dtotal40pr = int.parse(dt40pr.text);
                        d40prcolor2 = int.parse(dc2R40pr.text);
                      }
                      if (dtotal40pr >
                              data.get('total40pr') || //! =======> 👀 [total]
                          d40prcolor2 > data.get('40prcolor2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt40pr.clear();
                        dc2R40pr.clear();
                      } else {
                        dtotal40pr = int.parse(dt40pr.text);
                        d40prcolor2 = int.parse(dc2R40pr.text);
                        valueDeleteQuantaty40pr = data.get('total40pr') -
                            dtotal40pr; //! =======> 👀[total]
                        data.put('total40pr',
                            valueDeleteQuantaty40pr); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete40prColor2 = data.get('40prcolor2') -
                            d40prcolor2; //! =======> 👀[color2]
                        data.put('40prcolor2',
                            valueDelete40prColor2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt40pr.clear();
                    dc2R40pr.clear();
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
