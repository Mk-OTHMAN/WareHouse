import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef37J extends StatefulWidget {
  const AddRef37J({super.key});

  @override
  State<AddRef37J> createState() => _AddRef37JState();
}

class _AddRef37JState extends State<AddRef37J> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty37J = 0;
  int valueAdd37JColor1 = 0;
  int valueAdd37JColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal37J = 0;
  int add37Jcolor1 = 0;
  int add37Jcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total37J = TextEditingController();
    TextEditingController r37Jcolor1 = TextEditingController();
    TextEditingController r37Jcolor2 = TextEditingController();

    var t37J = total37J;
    var c1R37J = r37Jcolor1;
    var c2R37J = r37Jcolor2;

    if (data.get('total37J') == null) {
      data.put('total37J', 0);
    }
    if (data.get('37Jcolor1') == null) {
      data.put('37Jcolor1', 0);
    }
    if (data.get('37Jcolor2') == null) {
      data.put('37Jcolor2', 0);
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
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'Total Quantity',
                          textController: total37J),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'SL Quantity',
                          textController: r37Jcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'CH Quantity',
                          textController: r37Jcolor2),
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
                        if (t37J.text.isEmpty &&
                            c1R37J.text.isEmpty &&
                            c2R37J.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R37J.text.isEmpty && c2R37J.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t37J.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t37J.text.isEmpty && c2R37J.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R37J.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t37J.text.isEmpty && c1R37J.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R37J.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t37J.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R37J.clear();
                          c2R37J.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t37J.text.isNotEmpty &&
                            c1R37J.text.isNotEmpty &&
                            c2R37J.text.isNotEmpty) {
                          addtotal37J = int.parse(t37J.text);
                          add37Jcolor1 = int.parse(c1R37J.text);
                          add37Jcolor2 = int.parse(c2R37J.text);
                          if (valueAddQyantaty37J == 0) {
                            valueAddQyantaty37J = data
                                .get('total37J'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty37J += addtotal37J;
                            data.put(
                                'total37J', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty37J);
                          }

                          if (valueAdd37JColor1 == 0) {
                            valueAdd37JColor1 = data
                                .get('37Jcolor1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd37JColor1 += add37Jcolor1;
                            data.put(
                                '37Jcolor1', //! ========> 👀 [ COLOR 1]
                                valueAdd37JColor1);
                          }

                          if (valueAdd37JColor2 == 0) {
                            valueAdd37JColor2 = data
                                .get('37Jcolor2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd37JColor2 += add37Jcolor2;
                            data.put(
                                '37Jcolor2', //! =======>👀 [ COLOR 2]
                                valueAdd37JColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total37J.clear();
                          r37Jcolor1.clear();
                          r37Jcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R37J.text.isEmpty) {
                          addtotal37J = int.parse(t37J.text);
                          if (valueAddQyantaty37J == 0) {
                            valueAddQyantaty37J = data
                                .get('total37J'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty37J += addtotal37J;
                          data.put(
                              'total37J', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty37J);
                          add37Jcolor1 = int.parse(c1R37J.text);
                          if (valueAdd37JColor1 == 0) {
                            valueAdd37JColor1 = data
                                .get('37Jcolor1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd37JColor1 += add37Jcolor1;
                          data.put(
                              '37Jcolor1', //! =======> 👀 [ COLOR 1]
                              valueAdd37JColor1);
                          t37J.clear();
                          c1R37J.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal37J = int.parse(t37J.text);
                          if (valueAddQyantaty37J == 0) {
                            valueAddQyantaty37J =
                                data.get('total37J'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty37J += addtotal37J;
                          data.put(
                              'total37J', //! =======> 👀 [TOTAL]
                              valueAddQyantaty37J);
                          add37Jcolor2 = int.parse(c2R37J.text);
                          if (valueAdd37JColor2 == 0) {
                            valueAdd37JColor2 =
                                data.get('37Jcolor2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd37JColor2 += add37Jcolor2;
                          data.put(
                              '37Jcolor2', //! =======> 👀 [COLOR 2]
                              valueAdd37JColor2);
                          t37J.clear();
                          c2R37J.clear();
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
