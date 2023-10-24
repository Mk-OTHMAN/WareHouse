import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW8460 extends StatefulWidget {
  const SellW8460({super.key});

  @override
  State<SellW8460> createState() => _SellW8460State();
}

class _SellW8460State extends State<SellW8460> {
  @override
  Widget build(BuildContext context) {
    Box data = Hive.box('data');
    //! variables for calculate proccess to data
    int valueDeleteQuantaty8460 = 0;
    int valueDelete8460Color1 = 0;
    int valueDelete8460Color2 = 0;
    //! variables for parseing proccess at controller
    int dtotal8460 = 0;
    int d8460color1 = 0;
    int d8460color2 = 0;
    TextEditingController deletetotal8460 = TextEditingController();
    TextEditingController delete8460color1 = TextEditingController();
    TextEditingController delete8460color2 = TextEditingController();
    var dt8460 = deletetotal8460;
    var dc1R8460 = delete8460color1;
    var dc2R8460 = delete8460color2;
    if (data.get('total8460') == null) {
      data.put('total8460', 0);
    }
    if (data.get('8460color1') == null) {
      data.put('8460color1', 0);
    }
    if (data.get('8460color2') == null) {
      data.put('8460color2', 0);
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
                      textController: deletetotal8460)),
              //!  ________  sl quantity  ___________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'WH Quantity',
                      textController: delete8460color1)),
              //! ______________  ch quantity  __________
              Expanded(
                  child: ComponentButtomSheet(
                      componentName: 'SL Quantity',
                      textController: delete8460color2))
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
                      if (dt8460.text.isEmpty &&
                          dc1R8460.text.isEmpty &&
                          dc2R8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/Robot.json');
                      }
                      // ?_______ chek if recived from user Quantaty only ________ //
                      else if (dc1R8460.text.isEmpty && dc2R8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'you must choose at least one color.',
                            'Assets/lottie/Robot.json');
                        dt8460.clear();
                      }
                      //? __________ check if recived from user color 1 only ________ //
                      else if (dt8460.text.isEmpty && dc2R8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1R8460.clear();
                      }
                      // ?________ chek if recived from user color 2 only _________ //
                      else if (dt8460.text.isEmpty && dc1R8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc2R8460.clear();
                      }
                      // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                      else if (dt8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/Robot.json');
                        dc1R8460.clear();
                        dc2R8460.clear();
                      }

                      //? _____________ Check All Quantaty And input from User _________ //
                      else if (data.get('total8460') == 0) {
                        //! =======> 👀
                        dtotal8460 = int.parse(deletetotal8460.text);
                        if (dtotal8460 > data.get('total8460')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''',
                              'Assets/lottie/Robot.json');
                          dt8460.clear();
                          dc1R8460.clear();
                        }
                      }
                      //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                      else if (data.get('8460color1') == 0 || d8460color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d8460color1 >
                                data.get('8460color1') && //! =======> 👀
                            data.get('8460color1') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''',
                              'Assets/lottie/Robot.json');
                        }
                        dc1R8460.clear();
                      }
                      //? ___________ Check Color 2 Quantaty And input from User _____________
                      else if (data.get('8460color2') == 0 || d8460color1 > 0) {
                        //! =======> 👀
                        showDialogFunction(
                            'WRONG',
                            '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''',
                            'Assets/lottie/Robot.json');
                        if (d8460color2 >
                                data.get('8460color2') && //! =======> 👀
                            data.get('8460color2') > 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''',
                              'Assets/lottie/Robot.json');
                        }
                      }
                      //! __________________  case delete at one time 3*1 _________
                      else if (dt8460.text.isNotEmpty &&
                          dc1R8460.text.isNotEmpty &&
                          dc2R8460.text.isNotEmpty) {
                        dtotal8460 = int.parse(dt8460.text);
                        d8460color1 = int.parse(dc1R8460.text);
                        d8460color2 = int.parse(dc2R8460.text);
                        if (dtotal8460 >
                                    data.get('total8460') && //! =======> 👀
                                data.get('total8460') >= 0 || //! =======> 👀
                            d8460color1 >
                                    data.get('8460color1') && //! =======> 👀
                                data.get('8460color1') >= 0 || //! =======> 👀
                            d8460color2 >
                                    data.get('8460color2') && //! =======> 👀
                                data.get('8460color2') >= 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'please check on the total Quantity and colors Quantity',
                              'Assets/lottie/Robot.json');
                          dt8460.clear();
                          dc1R8460.clear();
                          dc2R8460.clear();
                        } else {
                          dtotal8460 = int.parse(dt8460.text);
                          d8460color1 = int.parse(dc1R8460.text);
                          d8460color2 = int.parse(dc2R8460.text);
                          valueDeleteQuantaty8460 = data.get('total8460') -
                              dtotal8460; //! =======> 👀
                          data.put('total8460',
                              valueDeleteQuantaty8460); //! =======> 👀
                          valueDelete8460Color1 = data.get('8460color1') -
                              d8460color1; //! =======> 👀
                          data.put('8460color1',
                              valueDelete8460Color1); //! =======> 👀
                          valueDelete8460Color2 = data.get('8460color2') -
                              d8460color2; //! =======> 👀
                          data.put('8460color2',
                              valueDelete8460Color2); //! =======> 👀
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                          dt8460.clear();
                          dc1R8460.clear();
                          dc2R8460.clear();
                        }
                      }

                      //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                      else if (dc2R8460.text.isEmpty) {
                        if (data.get('total8460') > 0 || //! =======> 👀
                            data.get('8460color1') > 0) {
                          //! =======> 👀
                          dtotal8460 = int.parse(dt8460.text);
                          d8460color1 = int.parse(dc1R8460.text);

                          if (dtotal8460 >
                                  data.get('total8460') || //! =======> 👀
                              d8460color1 > data.get('8460color1')) {
                            //! =======> 👀
                            showDialogFunction(
                                'WRONG',
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                                'Assets/lottie/Robot.json');
                          } else {
                            dtotal8460 = int.parse(dt8460.text);
                            d8460color1 = int.parse(dc1R8460.text);
                            valueDeleteQuantaty8460 = data.get('total8460') -
                                dtotal8460; //! =======> 👀
                            data.put('total8460',
                                valueDeleteQuantaty8460); //! =======> 👀

                            valueDelete8460Color1 = data.get('8460color1') -
                                d8460color1; //! =======> 👀
                            data.put('8460color1',
                                valueDelete8460Color1); //! =======> 👀

                            showDialogFunction(
                                'DONE',
                                'success process, and well done for remembering to remove the product',
                                'Assets/lottie/DoneGreen.json');
                          }
                        }
                        dt8460.clear();
                        dc1R8460.clear();
                      }

                      // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                      else if (dc1R8460.text.isEmpty) {
                        if (data.get('total8460') > 0 || //! =======> 👀
                            data.get('8460color2') > 0) {
                          //! =======> 👀
                          dtotal8460 = int.parse(dt8460.text);
                          d8460color2 = int.parse(dc2R8460.text);
                        }
                        if (dtotal8460 >
                                data.get('total8460') || //! =======> 👀
                            d8460color2 > data.get('8460color2')) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                              'Assets/lottie/Robot.json');
                          dt8460.clear();
                          dc2R8460.clear();
                        } else {
                          dtotal8460 = int.parse(dt8460.text);
                          d8460color2 = int.parse(dc2R8460.text);
                          valueDeleteQuantaty8460 = data.get('total8460') -
                              dtotal8460; //! =======> 👀
                          data.put('total8460',
                              valueDeleteQuantaty8460); //! =======> 👀
                          // dt18.clear();

                          valueDelete8460Color2 = data.get('8460color2') -
                              d8460color2; //! =======> 👀
                          data.put('8460color2',
                              valueDelete8460Color2); //! =======> 👀

                          //dc2f18.clear();
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to remove the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      }

                      dt8460.clear();
                      dc2R8460.clear();
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
