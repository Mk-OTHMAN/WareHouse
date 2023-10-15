import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef37 extends StatefulWidget {
  const AddRef37({super.key});

  @override
  State<AddRef37> createState() => _AddRef37State();
}

class _AddRef37State extends State<AddRef37> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty37 = 0;
  int valueAdd37Color1 = 0;
  int valueAdd37Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal37 = 0;
  int add37color1 = 0;
  int add37color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total37 = TextEditingController();
    TextEditingController r37color1 = TextEditingController();
    TextEditingController r37color2 = TextEditingController();

    var t37 = total37;
    var c1R37 = r37color1;
    var c2R37 = r37color2;

    if (data.get('total37') == null) {
      data.put('total37', 0);
    }
    if (data.get('37color1') == null) {
      data.put('37color1', 0);
    }
    if (data.get('37color2') == null) {
      data.put('37color2', 0);
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
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                      child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                          componentName: 'Total Quantity',
                          textController: total37),
                    ),
                    //! _______________ sl quantity __________
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
                          textController: r37color1),
                    ),

                    //! _____________ ch quantity  ______________
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
                          textController: r37color2),
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
                        if (t37.text.isEmpty &&
                            c1R37.text.isEmpty &&
                            c2R37.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R37.text.isEmpty && c2R37.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t37.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t37.text.isEmpty && c2R37.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R37.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t37.text.isEmpty && c1R37.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R37.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t37.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R37.clear();
                          c2R37.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t37.text.isNotEmpty &&
                            c1R37.text.isNotEmpty &&
                            c2R37.text.isNotEmpty) {
                          addtotal37 = int.parse(t37.text);
                          add37color1 = int.parse(c1R37.text);
                          add37color2 = int.parse(c2R37.text);
                          if (valueAddQyantaty37 == 0) {
                            valueAddQyantaty37 = data.get(
                                'total37'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty37 += addtotal37;
                            data.put(
                                'total37', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty37);
                          }

                          if (valueAdd37Color1 == 0) {
                            valueAdd37Color1 = data
                                .get('37color1'); //!  ==========> 👀    COLOR 1
                            valueAdd37Color1 += add37color1;
                            data.put(
                                '37color1', //! ========> 👀  COLOR 1
                                valueAdd37Color1);
                          }

                          if (valueAdd37Color2 == 0) {
                            valueAdd37Color2 = data
                                .get('37color2'); // ! =======> 👀    COLOR 2
                            valueAdd37Color2 += add37color2;
                            data.put(
                                '37color2', //! =======>👀  COLOR 2
                                valueAdd37Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total37.clear();
                          r37color1.clear();
                          r37color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R37.text.isEmpty) {
                          addtotal37 = int.parse(t37.text);
                          if (valueAddQyantaty37 == 0) {
                            valueAddQyantaty37 = data.get(
                                'total37'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty37 += addtotal37;
                          data.put(
                              'total37', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty37);
                          add37color1 = int.parse(c1R37.text);
                          if (valueAdd37Color1 == 0) {
                            valueAdd37Color1 =
                                data.get('37color1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd37Color1 += add37color1;
                          data.put(
                              '37color1', //! =======> 👀  COLOR 1
                              valueAdd37Color1);
                          t37.clear();
                          c1R37.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal37 = int.parse(t37.text);
                          if (valueAddQyantaty37 == 0) {
                            valueAddQyantaty37 = data
                                .get('total37'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty37 += addtotal37;
                          data.put(
                              'total37', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty37);
                          add37color2 = int.parse(c2R37.text);
                          if (valueAdd37Color2 == 0) {
                            valueAdd37Color2 =
                                data.get('37color2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd37Color2 += add37color2;
                          data.put(
                              '37color2', //! =======> 👀 COLOR 2
                              valueAdd37Color2);
                          t37.clear();
                          c2R37.clear();
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
