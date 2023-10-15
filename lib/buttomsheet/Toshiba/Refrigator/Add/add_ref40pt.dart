import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef40pt extends StatefulWidget {
  const AddRef40pt({super.key});

  @override
  State<AddRef40pt> createState() => _AddRef40ptState();
}

class _AddRef40ptState extends State<AddRef40pt> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty40pt = 0;
  int valueAdd40ptColor1 = 0;
  int valueAdd40ptColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal40pt = 0;
  int add40ptcolor1 = 0;
  int add40ptcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total40pt = TextEditingController();
    TextEditingController r40ptcolor1 = TextEditingController();
    TextEditingController r40ptcolor2 = TextEditingController();

    var t40pt = total40pt;
    var c1R40pt = r40ptcolor1;
    var c2R40pt = r40ptcolor2;

    if (data.get('total40pt') == null) {
      data.put('total40pt', 0);
    }
    if (data.get('40ptcolor1') == null) {
      data.put('40ptcolor1', 0);
    }
    if (data.get('40ptcolor2') == null) {
      data.put('40ptcolor2', 0);
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
                          textController: total40pt),
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
                          textController: r40ptcolor1),
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
                          textController: r40ptcolor2),
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
                        if (t40pt.text.isEmpty &&
                            c1R40pt.text.isEmpty &&
                            c2R40pt.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R40pt.text.isEmpty && c2R40pt.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t40pt.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t40pt.text.isEmpty && c2R40pt.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pt.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t40pt.text.isEmpty && c1R40pt.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R40pt.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t40pt.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pt.clear();
                          c2R40pt.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t40pt.text.isNotEmpty &&
                            c1R40pt.text.isNotEmpty &&
                            c2R40pt.text.isNotEmpty) {
                          addtotal40pt = int.parse(t40pt.text);
                          add40ptcolor1 = int.parse(c1R40pt.text);
                          add40ptcolor2 = int.parse(c2R40pt.text);
                          if (valueAddQyantaty40pt == 0) {
                            valueAddQyantaty40pt = data
                                .get('total40pt'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty40pt += addtotal40pt;
                            data.put(
                                'total40pt', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty40pt);
                          }

                          if (valueAdd40ptColor1 == 0) {
                            valueAdd40ptColor1 = data.get(
                                '40ptcolor1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd40ptColor1 += add40ptcolor1;
                            data.put(
                                '40ptcolor1', //! ========> 👀 [ COLOR 1]
                                valueAdd40ptColor1);
                          }

                          if (valueAdd40ptColor2 == 0) {
                            valueAdd40ptColor2 = data
                                .get('40ptcolor2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd40ptColor2 += add40ptcolor2;
                            data.put(
                                '40ptcolor2', //! =======>👀 [ COLOR 2]
                                valueAdd40ptColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total40pt.clear();
                          r40ptcolor1.clear();
                          r40ptcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R40pt.text.isEmpty) {
                          addtotal40pt = int.parse(t40pt.text);
                          if (valueAddQyantaty40pt == 0) {
                            valueAddQyantaty40pt = data
                                .get('total40pt'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty40pt += addtotal40pt;
                          data.put(
                              'total40pt', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty40pt);
                          add40ptcolor1 = int.parse(c1R40pt.text);
                          if (valueAdd40ptColor1 == 0) {
                            valueAdd40ptColor1 = data
                                .get('40ptcolor1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd40ptColor1 += add40ptcolor1;
                          data.put(
                              '40ptcolor1', //! =======> 👀 [ COLOR 1]
                              valueAdd40ptColor1);
                          t40pt.clear();
                          c1R40pt.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal40pt = int.parse(t40pt.text);
                          if (valueAddQyantaty40pt == 0) {
                            valueAddQyantaty40pt =
                                data.get('total40pt'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty40pt += addtotal40pt;
                          data.put(
                              'total40pt', //! =======> 👀 [TOTAL]
                              valueAddQyantaty40pt);
                          add40ptcolor2 = int.parse(c2R40pt.text);
                          if (valueAdd40ptColor2 == 0) {
                            valueAdd40ptColor2 = data
                                .get('40ptcolor2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd40ptColor2 += add40ptcolor2;
                          data.put(
                              '40ptcolor2', //! =======> 👀 [COLOR 2]
                              valueAdd40ptColor2);
                          t40pt.clear();
                          c2R40pt.clear();
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
