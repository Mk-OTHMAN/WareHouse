import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW720 extends StatefulWidget {
  const SellW720({super.key});

  @override
  State<SellW720> createState() => _SellW720State();
}

class _SellW720State extends State<SellW720> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty720 = 0;
    int valueDelete720Color1 = 0;
    int valueDelete720Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal720 = 0;
    int d720color1 = 0;
    int d720color2 = 0;
    TextEditingController deletetotal720 = TextEditingController();
    TextEditingController delete720color1 = TextEditingController();
    TextEditingController delete720color2 = TextEditingController();
    var dt720 = deletetotal720;
    var dc1W720 = delete720color1;
    var dc2W720 = delete720color2;
    if (data.get('total720') == null) {
      data.put('total720', 0);
    }
    if (data.get('720color1') == null) {
      data.put('720color1', 0);
    }
    if (data.get('720color2') == null) {
      data.put('720color2', 0);
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
                        textController: deletetotal720)),
                //!  ________  sl quantity  ___________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: delete720color1)),
                //! ______________  ch quantity  __________
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: delete720color2))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (dt720.text.isEmpty &&
                        dc1W720.text.isEmpty &&
                        dc2W720.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // ?_______ chek if recived from user Quantaty only ________ //
                    else if (dc1W720.text.isEmpty && dc2W720.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      dt720.clear();
                    }
                    //? __________ check if recived from user color 1 only ________ //
                    else if (dt720.text.isEmpty && dc2W720.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W720.clear();
                    }
                    // ?________ chek if recived from user color 2 only _________ //
                    else if (dt720.text.isEmpty && dc1W720.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc2W720.clear();
                    }
                    // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (dt720.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      dc1W720.clear();
                      dc2W720.clear();
                    }

                    //? _____________ Check All Quantaty And input from User _________ //
                    else if (data.get('total720') == 0) {
                      //! =======> 👀
                      dtotal720 = int.parse(deletetotal720.text);
                      if (dtotal720 > data.get('total720')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                            'Assets/lottie/Robot.json');
                        dt720.clear();
                        dc1W720.clear();
                      }
                    }
                    //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                    else if (data.get('720color1') == 0 || d720color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d720color1 > data.get('720color1') && //! =======> 👀
                          data.get('720color1') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                            'Assets/lottie/Robot.json');
                      }
                      dc1W720.clear();
                    }
                    //? ___________ Check Color 2 Quantaty And input from User _____________
                    else if (data.get('720color2') == 0 || d720color1 > 0) {
                      //! =======> 👀
                      showDialogFunction(
                          'WRONG',
                          '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                          'Assets/lottie/Robot.json');
                      if (d720color2 > data.get('720color2') && //! =======> 👀
                          data.get('720color2') > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                            'Assets/lottie/Robot.json');
                      }
                    }
                    //! __________________  case delete at one time 3*1 _________
                    else if (dt720.text.isNotEmpty &&
                        dc1W720.text.isNotEmpty &&
                        dc2W720.text.isNotEmpty) {
                      dtotal720 = int.parse(dt720.text);
                      d720color1 = int.parse(dc1W720.text);
                      d720color2 = int.parse(dc2W720.text);
                      if (dtotal720 > data.get('total720') && //! =======> 👀
                              data.get('total720') >= 0 || //! =======> 👀
                          d720color1 > data.get('720color1') && //! =======> 👀
                              data.get('720color1') >= 0 || //! =======> 👀
                          d720color2 > data.get('720color2') && //! =======> 👀
                              data.get('720color2') >= 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        dt720.clear();
                        dc1W720.clear();
                        dc2W720.clear();
                      } else {
                        dtotal720 = int.parse(dt720.text);
                        d720color1 = int.parse(dc1W720.text);
                        d720color2 = int.parse(dc2W720.text);
                        valueDeleteQuantaty720 =
                            data.get('total720') - dtotal720; //! =======> 👀
                        data.put(
                            'total720', valueDeleteQuantaty720); //! =======> 👀
                        valueDelete720Color1 =
                            data.get('720color1') - d720color1; //! =======> 👀
                        data.put(
                            '720color1', valueDelete720Color1); //! =======> 👀
                        valueDelete720Color2 =
                            data.get('720color2') - d720color2; //! =======> 👀
                        data.put(
                            '720color2', valueDelete720Color2); //! =======> 👀
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        dt720.clear();
                        dc1W720.clear();
                        dc2W720.clear();
                      }
                    }

                    //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                    else if (dc2W720.text.isEmpty) {
                      if (data.get('total720') > 0 || //! =======> 👀
                          data.get('720color1') > 0) {
                        //! =======> 👀
                        dtotal720 = int.parse(dt720.text);
                        d720color1 = int.parse(dc1W720.text);

                        if (dtotal720 > data.get('total720') || //! =======> 👀
                            d720color1 > data.get('720color1')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                        } else {
                          dtotal720 = int.parse(dt720.text);
                          d720color1 = int.parse(dc1W720.text);
                          valueDeleteQuantaty720 =
                              data.get('total720') - dtotal720; //! =======> 👀
                          data.put('total720',
                              valueDeleteQuantaty720); //! =======> 👀

                          valueDelete720Color1 = data.get('720color1') -
                              d720color1; //! =======> 👀
                          data.put('720color1',
                              valueDelete720Color1); //! =======> 👀

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }
                      dt720.clear();
                      dc1W720.clear();
                    }

                    // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                    else if (dc1W720.text.isEmpty) {
                      if (data.get('total720') > 0 || //! =======> 👀
                          data.get('720color2') > 0) {
                        //! =======> 👀
                        dtotal720 = int.parse(dt720.text);
                        d720color2 = int.parse(dc2W720.text);
                      }
                      if (dtotal720 > data.get('total720') || //! =======> 👀
                          d720color2 > data.get('720color2')) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                            'Assets/lottie/Robot.json');
                        dt720.clear();
                        dc2W720.clear();
                      } else {
                        dtotal720 = int.parse(dt720.text);
                        d720color2 = int.parse(dc2W720.text);
                        valueDeleteQuantaty720 =
                            data.get('total720') - dtotal720; //! =======> 👀
                        data.put(
                            'total720', valueDeleteQuantaty720); //! =======> 👀
                        // dt18.clear();

                        valueDelete720Color2 =
                            data.get('720color2') - d720color2; //! =======> 👀
                        data.put(
                            '720color2', valueDelete720Color2); //! =======> 👀

                        //dc2f18.clear();
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    }

                    dt720.clear();
                    dc2W720.clear();
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
