import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef45 extends StatefulWidget {
  const SellRef45({super.key});

  @override
  State<SellRef45> createState() => _SellRef45State();
}

class _SellRef45State extends State<SellRef45> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty45 = 0;
    int valueDelete45Color1 = 0;
    int valueDelete45Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal45 = 0;
    int d45color1 = 0;
    int d45color2 = 0;
    TextEditingController deletetotal45 = TextEditingController();
    TextEditingController delete45color1 = TextEditingController();
    TextEditingController delete45color2 = TextEditingController();
    var dt45 = deletetotal45;
    var dc1R45 = delete45color1;
    var dc2R45 = delete45color2;
    if (data.get('total45') == null) {
      data.put('total45', 0);
    }
    if (data.get('45color1') == null) {
      data.put('45color1', 0);
    }
    if (data.get('45color2') == null) {
      data.put('45color2', 0);
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
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                    child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                        componentName: 'Total Quantity',
                        textController: deletetotal45)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                    child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                        componentName: 'SL Quantity',
                        textController: delete45color1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                    child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                        componentName: 'CH Quantity',
                        textController: delete45color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt45.text.isEmpty &&
                        dc1R45.text.isEmpty &&
                        dc2R45.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R45.text.isEmpty && dc2R45.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt45.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt45.text.isEmpty && dc2R45.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R45.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt45.text.isEmpty && dc1R45.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R45.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt45.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R45.clear();
                      dc2R45.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total45') == 0) {
                      //! =======> 👀 [total]

                      dtotal45 = int.parse(deletetotal45.text);
                      if (dtotal45 > data.get('total45')) {
                        //! =======> 👀 [total]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt45.clear();
                        dc1R45.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('45color1') == 0 || d45color1 > 0) {
                      //! =======> 👀[color1]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d45color1 >
                              data.get('45color1') && //! =======> 👀 [color1]
                          data.get('45color1') > 0) {
                        //! =======> 👀 [color1]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R45.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('45color2') == 0 || d45color1 > 0) {
                      //! =======> 👀 [color2]

                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d45color2 >
                              data.get('45color2') && //! =======> 👀 [color2]
                          data.get('45color2') > 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt45.text.isNotEmpty &&
                        dc1R45.text.isNotEmpty &&
                        dc2R45.text.isNotEmpty) {
                      dtotal45 = int.parse(dt45.text);
                      d45color1 = int.parse(dc1R45.text);
                      d45color2 = int.parse(dc2R45.text);
                      if (dtotal45 >
                                  data.get('total45') && //! =======> 👀 [total]
                              data.get('total45') >=
                                  0 || //! =======> 👀 [total]
                          d45color1 >
                                  data.get(
                                      '45color1') && //! =======> 👀 [color1]
                              data.get('45color1') >=
                                  0 || //! =======> 👀[color1]
                          d45color2 >
                                  data.get(
                                      '45color2') && //! =======> 👀 [color2]
                              data.get('45color2') >= 0) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt45.clear();
                        dc1R45.clear();
                        dc2R45.clear();
                      } else {
                        dtotal45 = int.parse(dt45.text);
                        d45color1 = int.parse(dc1R45.text);
                        d45color2 = int.parse(dc2R45.text);
                        valueDeleteQuantaty45 = data.get('total45') -
                            dtotal45; //! =======> 👀 [total]
                        data.put('total45',
                            valueDeleteQuantaty45); //! =======> 👀 [total]
                        valueDelete45Color1 = data.get('45color1') -
                            d45color1; //! =======> 👀 [color1]
                        data.put('45color1',
                            valueDelete45Color1); //! =======> 👀 [color1]
                        valueDelete45Color2 = data.get('45color2') -
                            d45color2; //! =======> 👀 [color2]
                        data.put('45color2',
                            valueDelete45Color2); //! =======> 👀 [color2]
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt45.clear();
                        dc1R45.clear();
                        dc2R45.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R45.text.isEmpty) {
                      if (data.get('total45') > 0 || //! =======> 👀 [total]
                          data.get('45color1') > 0) {
                        //! =======> 👀 [color1]

                        dtotal45 = int.parse(dt45.text);
                        d45color1 = int.parse(dc1R45.text);

                        if (dtotal45 >
                                data.get('total45') || //! =======> 👀 [total]
                            d45color1 > data.get('45color1')) {
                          //! =======> 👀 [color1]

                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal45 = int.parse(dt45.text);
                          d45color1 = int.parse(dc1R45.text);
                          valueDeleteQuantaty45 = data.get('total45') -
                              dtotal45; //! =======> 👀 [total]
                          data.put('total45',
                              valueDeleteQuantaty45); //! =======> 👀 [total]

                          valueDelete45Color1 = data.get('45color1') -
                              d45color1; //! =======> 👀 [color1]
                          data.put('45color1',
                              valueDelete45Color1); //! =======> 👀 [color1]

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt45.clear();
                      dc1R45.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R45.text.isEmpty) {
                      if (data.get('total45') > 0 || //! =======> 👀[total]
                          data.get('45color2') > 0) {
                        //! =======> 👀[color2]

                        dtotal45 = int.parse(dt45.text);
                        d45color2 = int.parse(dc2R45.text);
                      }
                      if (dtotal45 >
                              data.get('total45') || //! =======> 👀 [total]
                          d45color2 > data.get('45color2')) {
                        //! =======> 👀 [color2]

                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt45.clear();
                        dc2R45.clear();
                      } else {
                        dtotal45 = int.parse(dt45.text);
                        d45color2 = int.parse(dc2R45.text);
                        valueDeleteQuantaty45 = data.get('total45') -
                            dtotal45; //! =======> 👀[total]
                        data.put('total45',
                            valueDeleteQuantaty45); //! =======> 👀[total]
                        // dt18.clear();

                        valueDelete45Color2 = data.get('45color2') -
                            d45color2; //! =======> 👀[color2]
                        data.put('45color2',
                            valueDelete45Color2); //! =======> 👀[color2]

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt45.clear();
                    dc2R45.clear();
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
