import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef37 extends StatefulWidget {
  const SellRef37({super.key});

  @override
  State<SellRef37> createState() => _SellRef37State();
}

class _SellRef37State extends State<SellRef37> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty37 = 0;
    int valueDelete37Color1 = 0;
    int valueDelete37Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal37 = 0;
    int d37color1 = 0;
    int d37color2 = 0;
    TextEditingController deletetotal37 = TextEditingController();
    TextEditingController delete37color1 = TextEditingController();
    TextEditingController delete37color2 = TextEditingController();
    var dt37 = deletetotal37;
    var dc1R37 = delete37color1;
    var dc2R37 = delete37color2;
    if (data.get('total37') == null) {
      data.put('total37', 0);
    }
    if (data.get('37color1') == null) {
      data.put('37color1', 0);
    }
    if (data.get('37color2') == null) {
      data.put('37color2', 0);
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
                        textController: deletetotal37)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'SL Quantity',
                        textController: delete37color1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'CH Quantity',
                        textController: delete37color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt37.text.isEmpty &&
                        dc1R37.text.isEmpty &&
                        dc2R37.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R37.text.isEmpty && dc2R37.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt37.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt37.text.isEmpty && dc2R37.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R37.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt37.text.isEmpty && dc1R37.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R37.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt37.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R37.clear();
                      dc2R37.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total37') == 0) {
                      //! =======> 👀
                      dtotal37 = int.parse(deletetotal37.text);
                      if (dtotal37 > data.get('total37')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt37.clear();
                        dc1R37.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('37color1') == 0 || d37color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d37color1 > data.get('37color1') && //! =======> 👀
                          data.get('37color1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R37.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('37color2') == 0 || d37color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d37color2 > data.get('37color2') && //! =======> 👀
                          data.get('37color2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt37.text.isNotEmpty &&
                        dc1R37.text.isNotEmpty &&
                        dc2R37.text.isNotEmpty) {
                      dtotal37 = int.parse(dt37.text);
                      d37color1 = int.parse(dc1R37.text);
                      d37color2 = int.parse(dc2R37.text);
                      if (dtotal37 > data.get('total37') && //! =======> 👀
                              data.get('total37') >= 0 || //! =======> 👀
                          d37color1 > data.get('37color1') && //! =======> 👀
                              data.get('37color1') >= 0 || //! =======> 👀
                          d37color2 > data.get('37color2') && //! =======> 👀
                              data.get('37color2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt37.clear();
                        dc1R37.clear();
                        dc2R37.clear();
                      } else {
                        dtotal37 = int.parse(dt37.text);
                        d37color1 = int.parse(dc1R37.text);
                        d37color2 = int.parse(dc2R37.text);
                        valueDeleteQuantaty37 =
                            data.get('total37') - dtotal37; //! =======> 👀
                        data.put(
                            'total37', valueDeleteQuantaty37); //! =======> 👀
                        valueDelete37Color1 =
                            data.get('37color1') - d37color1; //! =======> 👀
                        data.put(
                            '37color1', valueDelete37Color1); //! =======> 👀
                        valueDelete37Color2 =
                            data.get('37color2') - d37color2; //! =======> 👀
                        data.put(
                            '37color2', valueDelete37Color2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt37.clear();
                        dc1R37.clear();
                        dc2R37.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R37.text.isEmpty) {
                      if (data.get('total37') > 0 || //! =======> 👀
                          data.get('37color1') > 0) {
                        //! =======> 👀
                        dtotal37 = int.parse(dt37.text);
                        d37color1 = int.parse(dc1R37.text);

                        if (dtotal37 > data.get('total37') || //! =======> 👀
                            d37color1 > data.get('37color1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal37 = int.parse(dt37.text);
                          d37color1 = int.parse(dc1R37.text);
                          valueDeleteQuantaty37 =
                              data.get('total37') - dtotal37; //! =======> 👀
                          data.put(
                              'total37', valueDeleteQuantaty37); //! =======> 👀

                          valueDelete37Color1 =
                              data.get('37color1') - d37color1; //! =======> 👀
                          data.put(
                              '37color1', valueDelete37Color1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt37.clear();
                      dc1R37.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R37.text.isEmpty) {
                      if (data.get('total37') > 0 || //! =======> 👀
                          data.get('37color2') > 0) {
                        //! =======> 👀
                        dtotal37 = int.parse(dt37.text);
                        d37color2 = int.parse(dc2R37.text);
                      }
                      if (dtotal37 > data.get('total37') || //! =======> 👀
                          d37color2 > data.get('37color2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt37.clear();
                        dc2R37.clear();
                      } else {
                        dtotal37 = int.parse(dt37.text);
                        d37color2 = int.parse(dc2R37.text);
                        valueDeleteQuantaty37 =
                            data.get('total37') - dtotal37; //! =======> 👀
                        data.put(
                            'total37', valueDeleteQuantaty37); //! =======> 👀
                        // dt18.clear();

                        valueDelete37Color2 =
                            data.get('37color2') - d37color2; //! =======> 👀
                        data.put(
                            '37color2', valueDelete37Color2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt37.clear();
                    dc2R37.clear();
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
