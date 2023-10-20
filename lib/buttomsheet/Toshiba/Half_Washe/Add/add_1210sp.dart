import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher1210sp extends StatefulWidget {
  const AddWsher1210sp({super.key});

  @override
  State<AddWsher1210sp> createState() => _AddWsher1210spState();
}

class _AddWsher1210spState extends State<AddWsher1210sp> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1210sp = 0;
  int valueAdd1210spColor1 = 0;
  int valueAdd1210spColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1210sp = 0;
  int add1210spcolor1 = 0;
  int add1210spcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1210sp = TextEditingController();
    TextEditingController w1210spcolor1 = TextEditingController();
    TextEditingController w1210spcolor2 = TextEditingController();

    var t1210sp = total1210sp;
    var c1R1210sp = w1210spcolor1;
    var c2R1210sp = w1210spcolor2;

    if (data.get('total1210sp') == null) {
      data.put('total1210sp', 0);
    }
    if (data.get('1210spcolor1') == null) {
      data.put('1210spcolor1', 0);
    }
    if (data.get('1210spcolor2') == null) {
      data.put('1210spcolor2', 0);
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
                          textController: total1210sp),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'SL Quantity',
                          textController: w1210spcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'CH Quantity',
                          textController: w1210spcolor2),
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
                        if (t1210sp.text.isEmpty &&
                            c1R1210sp.text.isEmpty &&
                            c2R1210sp.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R1210sp.text.isEmpty &&
                            c2R1210sp.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t1210sp.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t1210sp.text.isEmpty &&
                            c2R1210sp.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1210sp.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t1210sp.text.isEmpty &&
                            c1R1210sp.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R1210sp.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t1210sp.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1210sp.clear();
                          c2R1210sp.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t1210sp.text.isNotEmpty &&
                            c1R1210sp.text.isNotEmpty &&
                            c2R1210sp.text.isNotEmpty) {
                          addtotal1210sp = int.parse(t1210sp.text);
                          add1210spcolor1 = int.parse(c1R1210sp.text);
                          add1210spcolor2 = int.parse(c2R1210sp.text);
                          if (valueAddQyantaty1210sp == 0) {
                            valueAddQyantaty1210sp = data.get(
                                'total1210sp'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty1210sp += addtotal1210sp;
                            data.put(
                                'total1210sp', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty1210sp);
                          }

                          if (valueAdd1210spColor1 == 0) {
                            valueAdd1210spColor1 = data.get(
                                '1210spcolor1'); //!  ==========> 👀    COLOR 1
                            valueAdd1210spColor1 += add1210spcolor1;
                            data.put(
                                '1210spcolor1', //! ========> 👀  COLOR 1
                                valueAdd1210spColor1);
                          }

                          if (valueAdd1210spColor2 == 0) {
                            valueAdd1210spColor2 = data.get(
                                '1210spcolor2'); // ! =======> 👀    COLOR 2
                            valueAdd1210spColor2 += add1210spcolor2;
                            data.put(
                                '1210spcolor2', //! =======>👀  COLOR 2
                                valueAdd1210spColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total1210sp.clear();
                          w1210spcolor1.clear();
                          w1210spcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R1210sp.text.isEmpty) {
                          addtotal1210sp = int.parse(t1210sp.text);
                          if (valueAddQyantaty1210sp == 0) {
                            valueAddQyantaty1210sp = data.get(
                                'total1210sp'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty1210sp += addtotal1210sp;
                          data.put(
                              'total1210sp', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty1210sp);
                          add1210spcolor1 = int.parse(c1R1210sp.text);
                          if (valueAdd1210spColor1 == 0) {
                            valueAdd1210spColor1 = data
                                .get('1210spcolor1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd1210spColor1 += add1210spcolor1;
                          data.put(
                              '1210spcolor1', //! =======> 👀  COLOR 1
                              valueAdd1210spColor1);
                          t1210sp.clear();
                          c1R1210sp.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal1210sp = int.parse(t1210sp.text);
                          if (valueAddQyantaty1210sp == 0) {
                            valueAddQyantaty1210sp = data.get(
                                'total1210sp'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty1210sp += addtotal1210sp;
                          data.put(
                              'total1210sp', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty1210sp);
                          add1210spcolor2 = int.parse(c2R1210sp.text);
                          if (valueAdd1210spColor2 == 0) {
                            valueAdd1210spColor2 = data
                                .get('1210spcolor2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd1210spColor2 += add1210spcolor2;
                          data.put(
                              '1210spcolor2', //! =======> 👀 COLOR 2
                              valueAdd1210spColor2);
                          t1210sp.clear();
                          c2R1210sp.clear();
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
