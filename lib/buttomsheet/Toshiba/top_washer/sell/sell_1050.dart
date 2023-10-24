import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1050 extends StatefulWidget {
  const SellW1050({super.key});

  @override
  State<SellW1050> createState() => _SellW1050State();
}

class _SellW1050State extends State<SellW1050> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1050 = 0;
    int valueDelete1050Color1 = 0;
    int valueDelete1050Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1050 = 0;
    int d1050color1 = 0;
    int d1050color2 = 0;
    TextEditingController deletetotal1050 = TextEditingController();
    TextEditingController delete1050color1 = TextEditingController();
    TextEditingController delete1050color2 = TextEditingController();
    var dt1050 = deletetotal1050;
    var dc1R1050 = delete1050color1;
    var dc2R1050 = delete1050color2;
    if (data.get('total1050') == null) {
      data.put('total1050', 0);
    }
    if (data.get('1050color1') == null) {
      data.put('1050color1', 0);
    }
    if (data.get('1050color2') == null) {
      data.put('1050color2', 0);
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

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/lump.jpg'), fit: BoxFit.fill),
          borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text('Sell Product From Your Stock',
              style: GoogleFonts.rowdies(
                  color: Colors.red,
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
                      textController: deletetotal1050)),
              //!  ________  sl quantity  ___________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'WH Quantity',
                      textController: delete1050color1)),
              //! ______________  ch quantity  __________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'SL Quantity',
                      textController: delete1050color2))
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  'SELL NOW',
                  style: GoogleFonts.caveat(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                      if (dt1050.text.isEmpty &&
                          dc1R1050.text.isEmpty &&
                          dc2R1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/Robot.json');
                      }
                      // ?_______ chek if recived from user Quantaty only ________ //
                      else if (dc1R1050.text.isEmpty && dc2R1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'you must choose at least one color.',
                            'Assets/lottie/Robot.json');
                        dt1050.clear();
                      }
                      //? __________ check if recived from user color 1 only ________ //
                      else if (dt1050.text.isEmpty && dc2R1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1R1050.clear();
                      }
                      // ?________ chek if recived from user color 2 only _________ //
                      else if (dt1050.text.isEmpty && dc1R1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc2R1050.clear();
                      }
                      // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                      else if (dt1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1R1050.clear();
                        dc2R1050.clear();
                      }

                      //? _____________ Check All Quantaty And input from User _________ //
                      else if (data.get('total1050') == 0) {
                        //! =======> 👀
                        dtotal1050 = int.parse(deletetotal1050.text);
                        if (dtotal1050 > data.get('total1050')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                              'Assets/lottie/Robot.json');
                          dt1050.clear();
                          dc1R1050.clear();
                        }
                      }
                      //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                      else if (data.get('1050color1') == 0 || d1050color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d1050color1 >
                                data.get('1050color1') && //! =======> 👀
                            data.get('1050color1') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                              'Assets/lottie/Robot.json');
                        }
                        dc1R1050.clear();
                      }
                      //? ___________ Check Color 2 Quantaty And input from User _____________
                      else if (data.get('1050color2') == 0 || d1050color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d1050color2 >
                                data.get('1050color2') && //! =======> 👀
                            data.get('1050color2') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                              'Assets/lottie/Robot.json');
                        }
                      }
                      //! __________________  case delete at one time 3*1 _________
                      else if (dt1050.text.isNotEmpty &&
                          dc1R1050.text.isNotEmpty &&
                          dc2R1050.text.isNotEmpty) {
                        dtotal1050 = int.parse(dt1050.text);
                        d1050color1 = int.parse(dc1R1050.text);
                        d1050color2 = int.parse(dc2R1050.text);
                        if (dtotal1050 >
                                    data.get('total1050') && //! =======> 👀
                                data.get('total1050') >= 0 || //! =======> 👀
                            d1050color1 >
                                    data.get('1050color1') && //! =======> 👀
                                data.get('1050color1') >= 0 || //! =======> 👀
                            d1050color2 >
                                    data.get('1050color2') && //! =======> 👀
                                data.get('1050color2') >= 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'please check on the total Quantity and colors Quantity',
                              'Assets/lottie/Robot.json');
                          dt1050.clear();
                          dc1R1050.clear();
                          dc2R1050.clear();
                        } else {
                          dtotal1050 = int.parse(dt1050.text);
                          d1050color1 = int.parse(dc1R1050.text);
                          d1050color2 = int.parse(dc2R1050.text);
                          valueDeleteQuantaty1050 = data.get('total1050') -
                              dtotal1050; //! =======> 👀
                          data.put('total1050',
                              valueDeleteQuantaty1050); //! =======> 👀
                          valueDelete1050Color1 = data.get('1050color1') -
                              d1050color1; //! =======> 👀
                          data.put('1050color1',
                              valueDelete1050Color1); //! =======> 👀
                          valueDelete1050Color2 = data.get('1050color2') -
                              d1050color2; //! =======> 👀
                          data.put('1050color2',
                              valueDelete1050Color2); //! =======> 👀
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                          dt1050.clear();
                          dc1R1050.clear();
                          dc2R1050.clear();
                        }
                      }

                      //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                      else if (dc2R1050.text.isEmpty) {
                        if (data.get('total1050') > 0 || //! =======> 👀
                            data.get('1050color1') > 0) {
                          //! =======> 👀
                          dtotal1050 = int.parse(dt1050.text);
                          d1050color1 = int.parse(dc1R1050.text);

                          if (dtotal1050 >
                                  data.get('total1050') || //! =======> 👀
                              d1050color1 > data.get('1050color1')) {
                            //! =======> 👀
                            showDialogFunction(
                                'WRONG',
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                                'Assets/lottie/Robot.json');
                          } else {
                            dtotal1050 = int.parse(dt1050.text);
                            d1050color1 = int.parse(dc1R1050.text);
                            valueDeleteQuantaty1050 = data.get('total1050') -
                                dtotal1050; //! =======> 👀
                            data.put('total1050',
                                valueDeleteQuantaty1050); //! =======> 👀

                            valueDelete1050Color1 = data.get('1050color1') -
                                d1050color1; //! =======> 👀
                            data.put('1050color1',
                                valueDelete1050Color1); //! =======> 👀

                            showDialogFunction(
                                'DONE',
                                'success process, and well done for remembering to remove the product',
                                'Assets/lottie/DoneGreen.json');
                          }
                        }
                        dt1050.clear();
                        dc1R1050.clear();
                      }

                      // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                      else if (dc1R1050.text.isEmpty) {
                        if (data.get('total1050') > 0 || //! =======> 👀
                            data.get('1050color2') > 0) {
                          //! =======> 👀
                          dtotal1050 = int.parse(dt1050.text);
                          d1050color2 = int.parse(dc2R1050.text);
                        }
                        if (dtotal1050 >
                                data.get('total1050') || //! =======> 👀
                            d1050color2 > data.get('1050color2')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                          dt1050.clear();
                          dc2R1050.clear();
                        } else {
                          dtotal1050 = int.parse(dt1050.text);
                          d1050color2 = int.parse(dc2R1050.text);
                          valueDeleteQuantaty1050 = data.get('total1050') -
                              dtotal1050; //! =======> 👀
                          data.put('total1050',
                              valueDeleteQuantaty1050); //! =======> 👀
                          // dt18.clear();

                          valueDelete1050Color2 = data.get('1050color2') -
                              d1050color2; //! =======> 👀
                          data.put('1050color2',
                              valueDelete1050Color2); //! =======> 👀

                          //dc2f18.clear();
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }

                      dt1050.clear();
                      dc2R1050.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                    size: 40,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
