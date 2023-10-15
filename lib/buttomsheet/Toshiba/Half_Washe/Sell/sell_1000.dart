import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1000 extends StatefulWidget {
  const SellW1000({super.key});

  @override
  State<SellW1000> createState() => _SellW1000State();
}

class _SellW1000State extends State<SellW1000> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1000 = 0;
    int valueDelete1000Color1 = 0;
    int valueDelete1000Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1000 = 0;
    int d1000color1 = 0;
    int d1000color2 = 0;
    TextEditingController deletetotal1000 = TextEditingController();
    TextEditingController delete1000color1 = TextEditingController();
    TextEditingController delete1000color2 = TextEditingController();
    var dt1000 = deletetotal1000;
    var dc1W1000 = delete1000color1;
    var dc2W1000 = delete1000color2;
    if (data.get('total1000') == null) {
      data.put('total1000', 0);
    }
    if (data.get('1000color1') == null) {
      data.put('1000color1', 0);
    }
    if (data.get('1000color2') == null) {
      data.put('1000color2', 0);
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
                        textController: deletetotal1000)),
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
                        textController: delete1000color1)),
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
                        textController: delete1000color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt1000.text.isEmpty &&
                        dc1W1000.text.isEmpty &&
                        dc2W1000.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W1000.text.isEmpty && dc2W1000.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt1000.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt1000.text.isEmpty && dc2W1000.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1000.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt1000.text.isEmpty && dc1W1000.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W1000.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt1000.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W1000.clear();
                      dc2W1000.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total1000') == 0) {
                      //! =======> 👀
                      dtotal1000 = int.parse(deletetotal1000.text);
                      if (dtotal1000 > data.get('total1000')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt1000.clear();
                        dc1W1000.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('1000color1') == 0 || d1000color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1000color1 >
                              data.get('1000color1') && //! =======> 👀
                          data.get('1000color1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W1000.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('1000color2') == 0 || d1000color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d1000color2 >
                              data.get('1000color2') && //! =======> 👀
                          data.get('1000color2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt1000.text.isNotEmpty &&
                        dc1W1000.text.isNotEmpty &&
                        dc2W1000.text.isNotEmpty) {
                      dtotal1000 = int.parse(dt1000.text);
                      d1000color1 = int.parse(dc1W1000.text);
                      d1000color2 = int.parse(dc2W1000.text);
                      if (dtotal1000 > data.get('total1000') && //! =======> 👀
                              data.get('total1000') >= 0 || //! =======> 👀
                          d1000color1 >
                                  data.get('1000color1') && //! =======> 👀
                              data.get('1000color1') >= 0 || //! =======> 👀
                          d1000color2 >
                                  data.get('1000color2') && //! =======> 👀
                              data.get('1000color2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt1000.clear();
                        dc1W1000.clear();
                        dc2W1000.clear();
                      } else {
                        dtotal1000 = int.parse(dt1000.text);
                        d1000color1 = int.parse(dc1W1000.text);
                        d1000color2 = int.parse(dc2W1000.text);
                        valueDeleteQuantaty1000 =
                            data.get('total1000') - dtotal1000; //! =======> 👀
                        data.put('total1000',
                            valueDeleteQuantaty1000); //! =======> 👀
                        valueDelete1000Color1 = data.get('1000color1') -
                            d1000color1; //! =======> 👀
                        data.put('1000color1',
                            valueDelete1000Color1); //! =======> 👀
                        valueDelete1000Color2 = data.get('1000color2') -
                            d1000color2; //! =======> 👀
                        data.put('1000color2',
                            valueDelete1000Color2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt1000.clear();
                        dc1W1000.clear();
                        dc2W1000.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W1000.text.isEmpty) {
                      if (data.get('total1000') > 0 || //! =======> 👀
                          data.get('1000color1') > 0) {
                        //! =======> 👀
                        dtotal1000 = int.parse(dt1000.text);
                        d1000color1 = int.parse(dc1W1000.text);

                        if (dtotal1000 >
                                data.get('total1000') || //! =======> 👀
                            d1000color1 > data.get('1000color1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal1000 = int.parse(dt1000.text);
                          d1000color1 = int.parse(dc1W1000.text);
                          valueDeleteQuantaty1000 = data.get('total1000') -
                              dtotal1000; //! =======> 👀
                          data.put('total1000',
                              valueDeleteQuantaty1000); //! =======> 👀

                          valueDelete1000Color1 = data.get('1000color1') -
                              d1000color1; //! =======> 👀
                          data.put('1000color1',
                              valueDelete1000Color1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt1000.clear();
                      dc1W1000.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W1000.text.isEmpty) {
                      if (data.get('total1000') > 0 || //! =======> 👀
                          data.get('1000color2') > 0) {
                        //! =======> 👀
                        dtotal1000 = int.parse(dt1000.text);
                        d1000color2 = int.parse(dc2W1000.text);
                      }
                      if (dtotal1000 > data.get('total1000') || //! =======> 👀
                          d1000color2 > data.get('1000color2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt1000.clear();
                        dc2W1000.clear();
                      } else {
                        dtotal1000 = int.parse(dt1000.text);
                        d1000color2 = int.parse(dc2W1000.text);
                        valueDeleteQuantaty1000 =
                            data.get('total1000') - dtotal1000; //! =======> 👀
                        data.put('total1000',
                            valueDeleteQuantaty1000); //! =======> 👀
                        // dt18.clear();

                        valueDelete1000Color2 = data.get('1000color2') -
                            d1000color2; //! =======> 👀
                        data.put('1000color2',
                            valueDelete1000Color2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt1000.clear();
                    dc2W1000.clear();
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
