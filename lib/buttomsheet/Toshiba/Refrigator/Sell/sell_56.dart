import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef56 extends StatefulWidget {
  const SellRef56({super.key});

  @override
  State<SellRef56> createState() => _SellRef56State();
}

class _SellRef56State extends State<SellRef56> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty56 = 0;
    int valueDelete56Color1 = 0;
    int valueDelete56Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal56 = 0;
    int d51color6 = 0;
    int d56color2 = 0;
    TextEditingController deletetotal56 = TextEditingController();
    TextEditingController delete56color1 = TextEditingController();
    TextEditingController delete56color2 = TextEditingController();
    var dt56 = deletetotal56;
    var dc1R56 = delete56color1;
    var dc2R56 = delete56color2;
    if (data.get('total56') == null) {
      data.put('total56', 0);
    }
    if (data.get('56color1') == null) {
      data.put('56color1', 0);
    }
    if (data.get('56color2') == null) {
      data.put('56color2', 0);
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
                        textController: deletetotal56)),
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
                        textController: delete56color1)),
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
                        textController: delete56color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt56.text.isEmpty &&
                        dc1R56.text.isEmpty &&
                        dc2R56.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R56.text.isEmpty && dc2R56.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt56.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt56.text.isEmpty && dc2R56.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R56.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt56.text.isEmpty && dc1R56.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R56.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt56.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R56.clear();
                      dc2R56.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total56') == 0) {
                      //! =======> 👀
                      dtotal56 = int.parse(deletetotal56.text);
                      if (dtotal56 > data.get('total56')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt56.clear();
                        dc1R56.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('56color1') == 0 || d51color6 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d51color6 > data.get('51color1') && //! =======> 👀
                          data.get('56color1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R56.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('56color2') == 0 || d51color6 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d56color2 > data.get('56color2') && //! =======> 👀
                          data.get('56color2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt56.text.isNotEmpty &&
                        dc1R56.text.isNotEmpty &&
                        dc2R56.text.isNotEmpty) {
                      dtotal56 = int.parse(dt56.text);
                      d51color6 = int.parse(dc1R56.text);
                      d56color2 = int.parse(dc2R56.text);
                      if (dtotal56 > data.get('total56') && //! =======> 👀
                              data.get('total56') >= 0 || //! =======> 👀
                          d51color6 > data.get('56color1') && //! =======> 👀
                              data.get('56color1') >= 0 || //! =======> 👀
                          d56color2 > data.get('56color2') && //! =======> 👀
                              data.get('56color2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt56.clear();
                        dc1R56.clear();
                        dc2R56.clear();
                      } else {
                        dtotal56 = int.parse(dt56.text);
                        d51color6 = int.parse(dc1R56.text);
                        d56color2 = int.parse(dc2R56.text);
                        valueDeleteQuantaty56 =
                            data.get('total56') - dtotal56; //! =======> 👀
                        data.put(
                            'total56', valueDeleteQuantaty56); //! =======> 👀
                        valueDelete56Color1 =
                            data.get('56color1') - d51color6; //! =======> 👀
                        data.put(
                            '56color1', valueDelete56Color1); //! =======> 👀
                        valueDelete56Color2 =
                            data.get('56color2') - d56color2; //! =======> 👀
                        data.put(
                            '56color2', valueDelete56Color2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt56.clear();
                        dc1R56.clear();
                        dc2R56.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R56.text.isEmpty) {
                      if (data.get('total56') > 0 || //! =======> 👀
                          data.get('56color1') > 0) {
                        //! =======> 👀
                        dtotal56 = int.parse(dt56.text);
                        d51color6 = int.parse(dc1R56.text);

                        if (dtotal56 > data.get('total56') || //! =======> 👀
                            d51color6 > data.get('56color1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal56 = int.parse(dt56.text);
                          d51color6 = int.parse(dc1R56.text);
                          valueDeleteQuantaty56 =
                              data.get('total56') - dtotal56; //! =======> 👀
                          data.put(
                              'total56', valueDeleteQuantaty56); //! =======> 👀

                          valueDelete56Color1 =
                              data.get('56color1') - d51color6; //! =======> 👀
                          data.put(
                              '56color1', valueDelete56Color1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt56.clear();
                      dc1R56.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R56.text.isEmpty) {
                      if (data.get('total56') > 0 || //! =======> 👀
                          data.get('56color2') > 0) {
                        //! =======> 👀
                        dtotal56 = int.parse(dt56.text);
                        d56color2 = int.parse(dc2R56.text);
                      }
                      if (dtotal56 > data.get('total56') || //! =======> 👀
                          d56color2 > data.get('56color2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt56.clear();
                        dc2R56.clear();
                      } else {
                        dtotal56 = int.parse(dt56.text);
                        d56color2 = int.parse(dc2R56.text);
                        valueDeleteQuantaty56 =
                            data.get('total56') - dtotal56; //! =======> 👀
                        data.put(
                            'total56', valueDeleteQuantaty56); //! =======> 👀
                        // dt18.clear();

                        valueDelete56Color2 =
                            data.get('56color2') - d56color2; //! =======> 👀
                        data.put(
                            '56color2', valueDelete56Color2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt56.clear();
                    dc2R56.clear();
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
