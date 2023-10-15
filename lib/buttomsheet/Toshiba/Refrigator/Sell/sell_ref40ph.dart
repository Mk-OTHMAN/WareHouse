import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef40ph extends StatefulWidget {
  const SellRef40ph({super.key});

  @override
  State<SellRef40ph> createState() => _SellRef40phState();
}

class _SellRef40phState extends State<SellRef40ph> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty40ph = 0;
    int valueDelete40phColor1 = 0;
    int valueDelete40phColor2 = 0;
    //! variables for parseing proccess at controller
    int dtotal40ph = 0;
    int d40phcolor1 = 0;
    int d40phcolor2 = 0;
    TextEditingController deletetotal40ph = TextEditingController();
    TextEditingController delete40phcolor1 = TextEditingController();
    TextEditingController delete40phcolor2 = TextEditingController();
    var dt40ph = deletetotal40ph;
    var dc1R40ph = delete40phcolor1;
    var dc2R40ph = delete40phcolor2;
    if (data.get('total40ph') == null) {
      data.put('total40ph', 0);
    }
    if (data.get('40phcolor1') == null) {
      data.put('40phcolor1', 0);
    }
    if (data.get('40phcolor2') == null) {
      data.put('40phcolor2', 0);
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
                        textController: deletetotal40ph)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'SL Quantity',
                        textController: delete40phcolor1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'CH Quantity',
                        textController: delete40phcolor2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt40ph.text.isEmpty &&
                        dc1R40ph.text.isEmpty &&
                        dc2R40ph.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R40ph.text.isEmpty && dc2R40ph.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt40ph.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt40ph.text.isEmpty && dc2R40ph.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40ph.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt40ph.text.isEmpty && dc1R40ph.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R40ph.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt40ph.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R40ph.clear();
                      dc2R40ph.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total40ph') == 0) {
                      //! =======> 👀 [total]

                      dtotal40ph = int.parse(deletetotal40ph.text);
                      if (dtotal40ph > data.get('total40ph')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt40ph.clear();
                        dc1R40ph.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('40phcolor1') == 0 || d40phcolor1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40phcolor1 >
                              data.get('40phcolor1') && //! =======> 👀 [color1]
                          data.get('40phcolor1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R40ph.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('40phcolor2') == 0 || d40phcolor1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d40phcolor2 >
                              data.get('40phcolor2') && //! =======> 👀 [color2]
                          data.get('40phcolor2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt40ph.text.isNotEmpty &&
                        dc1R40ph.text.isNotEmpty &&
                        dc2R40ph.text.isNotEmpty) {
                      dtotal40ph = int.parse(dt40ph.text);
                      d40phcolor1 = int.parse(dc1R40ph.text);
                      d40phcolor2 = int.parse(dc2R40ph.text);
                      if (dtotal40ph >
                                  data.get(
                                      'total40ph') && //! =======> 👀 [total]
                              data.get('total40ph') >=
                                  0 || //! =======> 👀 [total]
                          d40phcolor1 >
                                  data.get(
                                      '40phcolor1') && //! =======> 👀 [color1]
                              data.get('40phcolor1') >=
                                  0 || //! =======> 👀[color1]
                          d40phcolor2 >
                                  data.get(
                                      '40phcolor2') && //! =======> 👀 [color2]
                              data.get('40phcolor2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt40ph.clear();
                        dc1R40ph.clear();
                        dc2R40ph.clear();
                      } else {
                        dtotal40ph = int.parse(dt40ph.text);
                        d40phcolor1 = int.parse(dc1R40ph.text);
                        d40phcolor2 = int.parse(dc2R40ph.text);
                        valueDeleteQuantaty40ph = data.get('total40ph') -
                            dtotal40ph; //! =======> 👀 [total]
                        data.put('total40ph',
                            valueDeleteQuantaty40ph); //! =======> 👀 [total]
                        valueDelete40phColor1 = data.get('40phcolor1') -
                            d40phcolor1; //! =======> 👀 [color1]
                        data.put('40phcolor1',
                            valueDelete40phColor1); //! =======> 👀 [color1]
                        valueDelete40phColor2 = data.get('40phcolor2') -
                            d40phcolor2; //! =======> 👀 [color2]
                        data.put('40phcolor2',
                            valueDelete40phColor2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt40ph.clear();
                        dc1R40ph.clear();
                        dc2R40ph.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R40ph.text.isEmpty) {
                      if (data.get('total40ph') > 0 || //! =======> 👀 [total]
                          data.get('40phcolor1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal40ph = int.parse(dt40ph.text);
                        d40phcolor1 = int.parse(dc1R40ph.text);

                        if (dtotal40ph >
                                data.get('total40ph') || //! =======> 👀 [total]
                            d40phcolor1 > data.get('40phcolor1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal40ph = int.parse(dt40ph.text);
                          d40phcolor1 = int.parse(dc1R40ph.text);
                          valueDeleteQuantaty40ph = data.get('total40ph') -
                              dtotal40ph; //! =======> 👀 [total]
                          data.put('total40ph',
                              valueDeleteQuantaty40ph); //! =======> 👀 [total]

                          valueDelete40phColor1 = data.get('40phcolor1') -
                              d40phcolor1; //! =======> 👀 [color1]
                          data.put('40phcolor1',
                              valueDelete40phColor1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt40ph.clear();
                      dc1R40ph.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R40ph.text.isEmpty) {
                      if (data.get('total40ph') > 0 || //! =======> 👀[total]
                          data.get('40phcolor2') > 0) {
                        //! =======> 👀[color2]

                        dtotal40ph = int.parse(dt40ph.text);
                        d40phcolor2 = int.parse(dc2R40ph.text);
                      }
                      if (dtotal40ph >
                              data.get('total40ph') || //! =======> 👀 [total]
                          d40phcolor2 > data.get('40phcolor2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt40ph.clear();
                        dc2R40ph.clear();
                      } else {
                        dtotal40ph = int.parse(dt40ph.text);
                        d40phcolor2 = int.parse(dc2R40ph.text);
                        valueDeleteQuantaty40ph = data.get('total40ph') -
                            dtotal40ph; //! =======> 👀[total]
                        data.put('total40ph',
                            valueDeleteQuantaty40ph); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete40phColor2 = data.get('40phcolor2') -
                            d40phcolor2; //! =======> 👀[color2]
                        data.put('40phcolor2',
                            valueDelete40phColor2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt40ph.clear();
                    dc2R40ph.clear();
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
