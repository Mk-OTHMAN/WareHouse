import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1500 extends StatefulWidget {
  const SellW1500({super.key});

  @override
  State<SellW1500> createState() => _SellW1500State();
}

class _SellW1500State extends State<SellW1500> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty1500 = 0;
    int valueDelete1500Color1 = 0;
    int valueDelete1500Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal1500 = 0;
    int d1500color1 = 0;
    int d1500color2 = 0;
    TextEditingController deletetotal1500 = TextEditingController();
    TextEditingController delete1500color1 = TextEditingController();
    TextEditingController delete1500color2 = TextEditingController();
    var dt1500 = deletetotal1500;
    var dc1W1500 = delete1500color1;
    var dc2W1500 = delete1500color2;
    if (data.get('total1500') == null) {
      data.put('total1500', 0);
    }
    if (data.get('1500color1') == null) {
      data.put('1500color1', 0);
    }
    if (data.get('1500color2') == null) {
      data.put('1500color2', 0);
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
                      textController: deletetotal1500)),
              //!  ________  sl quantity  ___________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'WH Quantity',
                      textController: delete1500color1)),
              //! ______________  ch quantity  __________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'SL Quantity',
                      textController: delete1500color2))
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
                      if (dt1500.text.isEmpty &&
                          dc1W1500.text.isEmpty &&
                          dc2W1500.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/Robot.json');
                      }
                      // ?_______ chek if recived from user Quantaty only ________ //
                      else if (dc1W1500.text.isEmpty && dc2W1500.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'you must choose at least one color.',
                            'Assets/lottie/Robot.json');
                        dt1500.clear();
                      }
                      //? __________ check if recived from user color 1 only ________ //
                      else if (dt1500.text.isEmpty && dc2W1500.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1W1500.clear();
                      }
                      // ?________ chek if recived from user color 2 only _________ //
                      else if (dt1500.text.isEmpty && dc1W1500.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc2W1500.clear();
                      }
                      // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                      else if (dt1500.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1W1500.clear();
                        dc2W1500.clear();
                      }

                      //? _____________ Check All Quantaty And input from User _________ //
                      else if (data.get('total1500') == 0) {
                        //! =======> 👀
                        dtotal1500 = int.parse(deletetotal1500.text);
                        if (dtotal1500 > data.get('total1500')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                              'Assets/lottie/Robot.json');
                          dt1500.clear();
                          dc1W1500.clear();
                        }
                      }
                      //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                      else if (data.get('1500color1') == 0 || d1500color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d1500color1 >
                                data.get('1500color1') && //! =======> 👀
                            data.get('1500color1') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                              'Assets/lottie/Robot.json');
                        }
                        dc1W1500.clear();
                      }
                      //? ___________ Check Color 2 Quantaty And input from User _____________
                      else if (data.get('1500color2') == 0 || d1500color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d1500color2 >
                                data.get('1500color2') && //! =======> 👀
                            data.get('1500color2') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                              'Assets/lottie/Robot.json');
                        }
                      }
                      //! __________________  case delete at one time 3*1 _________
                      else if (dt1500.text.isNotEmpty &&
                          dc1W1500.text.isNotEmpty &&
                          dc2W1500.text.isNotEmpty) {
                        dtotal1500 = int.parse(dt1500.text);
                        d1500color1 = int.parse(dc1W1500.text);
                        d1500color2 = int.parse(dc2W1500.text);
                        if (dtotal1500 >
                                    data.get('total1500') && //! =======> 👀
                                data.get('total1500') >= 0 || //! =======> 👀
                            d1500color1 >
                                    data.get('1500color1') && //! =======> 👀
                                data.get('1500color1') >= 0 || //! =======> 👀
                            d1500color2 >
                                    data.get('1500color2') && //! =======> 👀
                                data.get('1500color2') >= 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'please check on the total Quantity and colors Quantity',
                              'Assets/lottie/Robot.json');
                          dt1500.clear();
                          dc1W1500.clear();
                          dc2W1500.clear();
                        } else {
                          dtotal1500 = int.parse(dt1500.text);
                          d1500color1 = int.parse(dc1W1500.text);
                          d1500color2 = int.parse(dc2W1500.text);
                          valueDeleteQuantaty1500 = data.get('total1500') -
                              dtotal1500; //! =======> 👀
                          data.put('total1500',
                              valueDeleteQuantaty1500); //! =======> 👀
                          valueDelete1500Color1 = data.get('1500color1') -
                              d1500color1; //! =======> 👀
                          data.put('1500color1',
                              valueDelete1500Color1); //! =======> 👀
                          valueDelete1500Color2 = data.get('1500color2') -
                              d1500color2; //! =======> 👀
                          data.put('1500color2',
                              valueDelete1500Color2); //! =======> 👀
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                          dt1500.clear();
                          dc1W1500.clear();
                          dc2W1500.clear();
                        }
                      }

                      //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                      else if (dc2W1500.text.isEmpty) {
                        if (data.get('total1500') > 0 || //! =======> 👀
                            data.get('1500color1') > 0) {
                          //! =======> 👀
                          dtotal1500 = int.parse(dt1500.text);
                          d1500color1 = int.parse(dc1W1500.text);

                          if (dtotal1500 >
                                  data.get('total1500') || //! =======> 👀
                              d1500color1 > data.get('1500color1')) {
                            //! =======> 👀
                            showDialogFunction(
                                'WRONG',
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                                'Assets/lottie/Robot.json');
                          } else {
                            dtotal1500 = int.parse(dt1500.text);
                            d1500color1 = int.parse(dc1W1500.text);
                            valueDeleteQuantaty1500 = data.get('total1500') -
                                dtotal1500; //! =======> 👀
                            data.put('total1500',
                                valueDeleteQuantaty1500); //! =======> 👀

                            valueDelete1500Color1 = data.get('1500color1') -
                                d1500color1; //! =======> 👀
                            data.put('1500color1',
                                valueDelete1500Color1); //! =======> 👀

                            showDialogFunction(
                                'DONE',
                                'success process, and well done for remembering to remove the product',
                                'Assets/lottie/DoneGreen.json');
                          }
                        }
                        dt1500.clear();
                        dc1W1500.clear();
                      }

                      // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                      else if (dc1W1500.text.isEmpty) {
                        if (data.get('total1500') > 0 || //! =======> 👀
                            data.get('1500color2') > 0) {
                          //! =======> 👀
                          dtotal1500 = int.parse(dt1500.text);
                          d1500color2 = int.parse(dc2W1500.text);
                        }
                        if (dtotal1500 >
                                data.get('total1500') || //! =======> 👀
                            d1500color2 > data.get('1500color2')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                          dt1500.clear();
                          dc2W1500.clear();
                        } else {
                          dtotal1500 = int.parse(dt1500.text);
                          d1500color2 = int.parse(dc2W1500.text);
                          valueDeleteQuantaty1500 = data.get('total1500') -
                              dtotal1500; //! =======> 👀
                          data.put('total1500',
                              valueDeleteQuantaty1500); //! =======> 👀
                          // dt18.clear();

                          valueDelete1500Color2 = data.get('1500color2') -
                              d1500color2; //! =======> 👀
                          data.put('1500color2',
                              valueDelete1500Color2); //! =======> 👀

                          //dc2f18.clear();
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }

                      dt1500.clear();
                      dc2W1500.clear();
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
