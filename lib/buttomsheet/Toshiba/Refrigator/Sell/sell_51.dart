import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellRef51 extends StatefulWidget {
  const SellRef51({super.key});

  @override
  State<SellRef51> createState() => _SellRef51State();
}

class _SellRef51State extends State<SellRef51> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty51 = 0;
    int valueDelete51Color1 = 0;
    int valueDelete51Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal51 = 0;
    int d51color1 = 0;
    int d51color2 = 0;
    TextEditingController deletetotal51 = TextEditingController();
    TextEditingController delete51color1 = TextEditingController();
    TextEditingController delete51color2 = TextEditingController();
    var dt51 = deletetotal51;
    var dc1R51 = delete51color1;
    var dc2R51 = delete51color2;
    if (data.get('total51') == null) {
      data.put('total51', 0);
    }
    if (data.get('51color1') == null) {
      data.put('51color1', 0);
    }
    if (data.get('51color2') == null) {
      data.put('51color2', 0);
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
                        textController: deletetotal51)),
                //!  ________  sl quantity  ___________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'SL Quantity',
                        textController: delete51color1)),
                //! ______________  ch quantity  __________
                Expanded(
<<<<<<< HEAD
                    child: ComponentButtomSheet(
=======
                    child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                        componentName: 'CH Quantity',
                        textController: delete51color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt51.text.isEmpty &&
                        dc1R51.text.isEmpty &&
                        dc2R51.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1R51.text.isEmpty && dc2R51.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt51.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt51.text.isEmpty && dc2R51.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R51.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt51.text.isEmpty && dc1R51.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2R51.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt51.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1R51.clear();
                      dc2R51.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total51') == 0) {
                      //! =======> 👀
                      dtotal51 = int.parse(deletetotal51.text);
                      if (dtotal51 > data.get('total51')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt51.clear();
                        dc1R51.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('51color1') == 0 || d51color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d51color1 > data.get('51color1') && //! =======> 👀
                          data.get('51color1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1R51.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('51color2') == 0 || d51color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d51color2 > data.get('51color2') && //! =======> 👀
                          data.get('51color2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt51.text.isNotEmpty &&
                        dc1R51.text.isNotEmpty &&
                        dc2R51.text.isNotEmpty) {
                      dtotal51 = int.parse(dt51.text);
                      d51color1 = int.parse(dc1R51.text);
                      d51color2 = int.parse(dc2R51.text);
                      if (dtotal51 > data.get('total51') && //! =======> 👀
                              data.get('total51') >= 0 || //! =======> 👀
                          d51color1 > data.get('51color1') && //! =======> 👀
                              data.get('51color1') >= 0 || //! =======> 👀
                          d51color2 > data.get('51color2') && //! =======> 👀
                              data.get('51color2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt51.clear();
                        dc1R51.clear();
                        dc2R51.clear();
                      } else {
                        dtotal51 = int.parse(dt51.text);
                        d51color1 = int.parse(dc1R51.text);
                        d51color2 = int.parse(dc2R51.text);
                        valueDeleteQuantaty51 =
                            data.get('total51') - dtotal51; //! =======> 👀
                        data.put(
                            'total51', valueDeleteQuantaty51); //! =======> 👀
                        valueDelete51Color1 =
                            data.get('51color1') - d51color1; //! =======> 👀
                        data.put(
                            '51color1', valueDelete51Color1); //! =======> 👀
                        valueDelete51Color2 =
                            data.get('51color2') - d51color2; //! =======> 👀
                        data.put(
                            '51color2', valueDelete51Color2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt51.clear();
                        dc1R51.clear();
                        dc2R51.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2R51.text.isEmpty) {
                      if (data.get('total51') > 0 || //! =======> 👀
                          data.get('51color1') > 0) {
                        //! =======> 👀
                        dtotal51 = int.parse(dt51.text);
                        d51color1 = int.parse(dc1R51.text);

                        if (dtotal51 > data.get('total51') || //! =======> 👀
                            d51color1 > data.get('51color1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal51 = int.parse(dt51.text);
                          d51color1 = int.parse(dc1R51.text);
                          valueDeleteQuantaty51 =
                              data.get('total51') - dtotal51; //! =======> 👀
                          data.put(
                              'total51', valueDeleteQuantaty51); //! =======> 👀

                          valueDelete51Color1 =
                              data.get('51color1') - d51color1; //! =======> 👀
                          data.put(
                              '51color1', valueDelete51Color1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt51.clear();
                      dc1R51.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1R51.text.isEmpty) {
                      if (data.get('total51') > 0 || //! =======> 👀
                          data.get('51color2') > 0) {
                        //! =======> 👀
                        dtotal51 = int.parse(dt51.text);
                        d51color2 = int.parse(dc2R51.text);
                      }
                      if (dtotal51 > data.get('total51') || //! =======> 👀
                          d51color2 > data.get('51color2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt51.clear();
                        dc2R51.clear();
                      } else {
                        dtotal51 = int.parse(dt51.text);
                        d51color2 = int.parse(dc2R51.text);
                        valueDeleteQuantaty51 =
                            data.get('total51') - dtotal51; //! =======> 👀
                        data.put(
                            'total51', valueDeleteQuantaty51); //! =======> 👀
                        // dt18.clear();

                        valueDelete51Color2 =
                            data.get('51color2') - d51color2; //! =======> 👀
                        data.put(
                            '51color2', valueDelete51Color2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt51.clear();
                    dc2R51.clear();
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
