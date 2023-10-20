import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef40pj extends StatefulWidget {
  const AddRef40pj({super.key});

  @override
  State<AddRef40pj> createState() => _AddRef40pjState();
}

class _AddRef40pjState extends State<AddRef40pj> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty40pj = 0;
  int valueAdd40pjColor1 = 0;
  int valueAdd40pjColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal40pj = 0;
  int add40pjcolor1 = 0;
  int add40pjcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total40pj = TextEditingController();
    TextEditingController r40pjcolor1 = TextEditingController();
    TextEditingController r40pjcolor2 = TextEditingController();

    var t40pj = total40pj;
    var c1R40pj = r40pjcolor1;
    var c2R40pj = r40pjcolor2;

    if (data.get('total40pj') == null) {
      data.put('total40pj', 0);
    }
    if (data.get('40pjcolor1') == null) {
      data.put('40pjcolor1', 0);
    }
    if (data.get('40pjcolor2') == null) {
      data.put('40pjcolor2', 0);
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
                      child: ComponentButtomSheet(
                          componentName: 'Total Quantity',
                          textController: total40pj),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'SL Quantity',
                          textController: r40pjcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'CH Quantity',
                          textController: r40pjcolor2),
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
                        if (t40pj.text.isEmpty &&
                            c1R40pj.text.isEmpty &&
                            c2R40pj.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R40pj.text.isEmpty && c2R40pj.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t40pj.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t40pj.text.isEmpty && c2R40pj.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pj.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t40pj.text.isEmpty && c1R40pj.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R40pj.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t40pj.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pj.clear();
                          c2R40pj.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t40pj.text.isNotEmpty &&
                            c1R40pj.text.isNotEmpty &&
                            c2R40pj.text.isNotEmpty) {
                          addtotal40pj = int.parse(t40pj.text);
                          add40pjcolor1 = int.parse(c1R40pj.text);
                          add40pjcolor2 = int.parse(c2R40pj.text);
                          if (valueAddQyantaty40pj == 0) {
                            valueAddQyantaty40pj = data
                                .get('total40pj'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty40pj += addtotal40pj;
                            data.put(
                                'total40pj', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty40pj);
                          }

                          if (valueAdd40pjColor1 == 0) {
                            valueAdd40pjColor1 = data.get(
                                '40pjcolor1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd40pjColor1 += add40pjcolor1;
                            data.put(
                                '40pjcolor1', //! ========> 👀 [ COLOR 1]
                                valueAdd40pjColor1);
                          }

                          if (valueAdd40pjColor2 == 0) {
                            valueAdd40pjColor2 = data
                                .get('40pjcolor2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd40pjColor2 += add40pjcolor2;
                            data.put(
                                '40pjcolor2', //! =======>👀 [ COLOR 2]
                                valueAdd40pjColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total40pj.clear();
                          r40pjcolor1.clear();
                          r40pjcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R40pj.text.isEmpty) {
                          addtotal40pj = int.parse(t40pj.text);
                          if (valueAddQyantaty40pj == 0) {
                            valueAddQyantaty40pj = data
                                .get('total40pj'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty40pj += addtotal40pj;
                          data.put(
                              'total40pj', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty40pj);
                          add40pjcolor1 = int.parse(c1R40pj.text);
                          if (valueAdd40pjColor1 == 0) {
                            valueAdd40pjColor1 = data
                                .get('40pjcolor1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd40pjColor1 += add40pjcolor1;
                          data.put(
                              '40pjcolor1', //! =======> 👀 [ COLOR 1]
                              valueAdd40pjColor1);
                          t40pj.clear();
                          c1R40pj.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal40pj = int.parse(t40pj.text);
                          if (valueAddQyantaty40pj == 0) {
                            valueAddQyantaty40pj =
                                data.get('total40pj'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty40pj += addtotal40pj;
                          data.put(
                              'total40pj', //! =======> 👀 [TOTAL]
                              valueAddQyantaty40pj);
                          add40pjcolor2 = int.parse(c2R40pj.text);
                          if (valueAdd40pjColor2 == 0) {
                            valueAdd40pjColor2 = data
                                .get('40pjcolor2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd40pjColor2 += add40pjcolor2;
                          data.put(
                              '40pjcolor2', //! =======> 👀 [COLOR 2]
                              valueAdd40pjColor2);
                          t40pj.clear();
                          c2R40pj.clear();
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
