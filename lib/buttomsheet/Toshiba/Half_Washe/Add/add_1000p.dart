import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher1000p extends StatefulWidget {
  const AddWsher1000p({super.key});

  @override
  State<AddWsher1000p> createState() => _AddWsher1000pState();
}

class _AddWsher1000pState extends State<AddWsher1000p> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1000p = 0;
  int valueAdd1000pColor1 = 0;
  int valueAdd1000pColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1000p = 0;
  int add1000pcolor1 = 0;
  int add1000pcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1000p = TextEditingController();
    TextEditingController w1000pcolor1 = TextEditingController();
    TextEditingController w1000pcolor2 = TextEditingController();

    var t1000p = total1000p;
    var c1R1000p = w1000pcolor1;
    var c2R1000p = w1000pcolor2;

    if (data.get('total1000p') == null) {
      data.put('total1000p', 0);
    }
    if (data.get('1000pcolor1') == null) {
      data.put('1000pcolor1', 0);
    }
    if (data.get('1000pcolor2') == null) {
      data.put('1000pcolor2', 0);
    }

    //! ===================  Function For ShowDialog ===============================
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

    return Row(
      children: [
        Expanded(
          flex: 2,
          //! -------------------------------------------------------------------
          //? _____________  container for adding proccess ______________________
          //! -------------------------------------------------------------------
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Add',
                    style: GoogleFonts.rowdies(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold)),
                //! _________________ row body _____________
                SizedBox(height: 25.h),
                Row(
                  children: [
                    //! ____________  total quantity  __________
                    Expanded(
                      child: component_buttom_sheet(
                          componentName: 'Total Quantity',
                          textController: total1000p),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
                      child: component_buttom_sheet(
                          componentName: 'SL Quantity',
                          textController: w1000pcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
                      child: component_buttom_sheet(
                          componentName: 'CH Quantity',
                          textController: w1000pcolor2),
                    )
                  ],
                ),
                //! ____________ sizedBox for Height __________
                SizedBox(
                  height: 150.h,
                ),
                // !________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                        if (t1000p.text.isEmpty &&
                            c1R1000p.text.isEmpty &&
                            c2R1000p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R1000p.text.isEmpty &&
                            c2R1000p.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t1000p.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t1000p.text.isEmpty && c2R1000p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1000p.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t1000p.text.isEmpty && c1R1000p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R1000p.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t1000p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1000p.clear();
                          c2R1000p.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t1000p.text.isNotEmpty &&
                            c1R1000p.text.isNotEmpty &&
                            c2R1000p.text.isNotEmpty) {
                          addtotal1000p = int.parse(t1000p.text);
                          add1000pcolor1 = int.parse(c1R1000p.text);
                          add1000pcolor2 = int.parse(c2R1000p.text);
                          if (valueAddQyantaty1000p == 0) {
                            valueAddQyantaty1000p = data.get(
                                'total1000p'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty1000p += addtotal1000p;
                            data.put(
                                'total1000p', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty1000p);
                          }

                          if (valueAdd1000pColor1 == 0) {
                            valueAdd1000pColor1 = data.get(
                                '1000pcolor1'); //!  ==========> 👀    COLOR 1
                            valueAdd1000pColor1 += add1000pcolor1;
                            data.put(
                                '1000pcolor1', //! ========> 👀  COLOR 1
                                valueAdd1000pColor1);
                          }

                          if (valueAdd1000pColor2 == 0) {
                            valueAdd1000pColor2 = data
                                .get('1000pcolor2'); // ! =======> 👀    COLOR 2
                            valueAdd1000pColor2 += add1000pcolor2;
                            data.put(
                                '1000pcolor2', //! =======>👀  COLOR 2
                                valueAdd1000pColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total1000p.clear();
                          w1000pcolor1.clear();
                          w1000pcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R1000p.text.isEmpty) {
                          addtotal1000p = int.parse(t1000p.text);
                          if (valueAddQyantaty1000p == 0) {
                            valueAddQyantaty1000p = data.get(
                                'total1000p'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty1000p += addtotal1000p;
                          data.put(
                              'total1000p', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty1000p);
                          add1000pcolor1 = int.parse(c1R1000p.text);
                          if (valueAdd1000pColor1 == 0) {
                            valueAdd1000pColor1 = data
                                .get('1000pcolor1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd1000pColor1 += add1000pcolor1;
                          data.put(
                              '1000pcolor1', //! =======> 👀  COLOR 1
                              valueAdd1000pColor1);
                          t1000p.clear();
                          c1R1000p.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal1000p = int.parse(t1000p.text);
                          if (valueAddQyantaty1000p == 0) {
                            valueAddQyantaty1000p = data.get(
                                'total1000p'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty1000p += addtotal1000p;
                          data.put(
                              'total1000p', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty1000p);
                          add1000pcolor2 = int.parse(c2R1000p.text);
                          if (valueAdd1000pColor2 == 0) {
                            valueAdd1000pColor2 = data
                                .get('1000pcolor2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd1000pColor2 += add1000pcolor2;
                          data.put(
                              '1000pcolor2', //! =======> 👀 COLOR 2
                              valueAdd1000pColor2);
                          t1000p.clear();
                          c2R1000p.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.playlist_add_check_circle_outlined,
                      size: 50,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
