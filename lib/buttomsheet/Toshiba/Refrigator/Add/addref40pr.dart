import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef40pr extends StatefulWidget {
  const AddRef40pr({super.key});

  @override
  State<AddRef40pr> createState() => _AddRef40prState();
}

class _AddRef40prState extends State<AddRef40pr> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty40pr = 0;
  int valueAdd40prColor1 = 0;
  int valueAdd40prColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal40pr = 0;
  int add40prcolor1 = 0;
  int add40prcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total40pr = TextEditingController();
    TextEditingController r40prcolor1 = TextEditingController();
    TextEditingController r40prcolor2 = TextEditingController();

    var t40pr = total40pr;
    var c1R40pr = r40prcolor1;
    var c2R40pr = r40prcolor2;

    if (data.get('total40pr') == null) {
      data.put('total40pr', 0);
    }
    if (data.get('40prcolor1') == null) {
      data.put('40prcolor1', 0);
    }
    if (data.get('40prcolor2') == null) {
      data.put('40prcolor2', 0);
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
                          textController: total40pr),
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
                          textController: r40prcolor1),
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
                          textController: r40prcolor2),
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
                        if (t40pr.text.isEmpty &&
                            c1R40pr.text.isEmpty &&
                            c2R40pr.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R40pr.text.isEmpty && c2R40pr.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t40pr.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t40pr.text.isEmpty && c2R40pr.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pr.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t40pr.text.isEmpty && c1R40pr.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R40pr.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t40pr.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40pr.clear();
                          c2R40pr.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t40pr.text.isNotEmpty &&
                            c1R40pr.text.isNotEmpty &&
                            c2R40pr.text.isNotEmpty) {
                          addtotal40pr = int.parse(t40pr.text);
                          add40prcolor1 = int.parse(c1R40pr.text);
                          add40prcolor2 = int.parse(c2R40pr.text);
                          if (valueAddQyantaty40pr == 0) {
                            valueAddQyantaty40pr = data
                                .get('total40pr'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty40pr += addtotal40pr;
                            data.put(
                                'total40pr', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty40pr);
                          }

                          if (valueAdd40prColor1 == 0) {
                            valueAdd40prColor1 = data.get(
                                '40prcolor1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd40prColor1 += add40prcolor1;
                            data.put(
                                '40prcolor1', //! ========> 👀 [ COLOR 1]
                                valueAdd40prColor1);
                          }

                          if (valueAdd40prColor2 == 0) {
                            valueAdd40prColor2 = data
                                .get('40prcolor2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd40prColor2 += add40prcolor2;
                            data.put(
                                '40prcolor2', //! =======>👀 [ COLOR 2]
                                valueAdd40prColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total40pr.clear();
                          r40prcolor1.clear();
                          r40prcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R40pr.text.isEmpty) {
                          addtotal40pr = int.parse(t40pr.text);
                          if (valueAddQyantaty40pr == 0) {
                            valueAddQyantaty40pr = data
                                .get('total40pr'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty40pr += addtotal40pr;
                          data.put(
                              'total40pr', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty40pr);
                          add40prcolor1 = int.parse(c1R40pr.text);
                          if (valueAdd40prColor1 == 0) {
                            valueAdd40prColor1 = data
                                .get('40prcolor1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd40prColor1 += add40prcolor1;
                          data.put(
                              '40prcolor1', //! =======> 👀 [ COLOR 1]
                              valueAdd40prColor1);
                          t40pr.clear();
                          c1R40pr.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal40pr = int.parse(t40pr.text);
                          if (valueAddQyantaty40pr == 0) {
                            valueAddQyantaty40pr =
                                data.get('total40pr'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty40pr += addtotal40pr;
                          data.put(
                              'total40pr', //! =======> 👀 [TOTAL]
                              valueAddQyantaty40pr);
                          add40prcolor2 = int.parse(c2R40pr.text);
                          if (valueAdd40prColor2 == 0) {
                            valueAdd40prColor2 = data
                                .get('40prcolor2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd40prColor2 += add40prcolor2;
                          data.put(
                              '40prcolor2', //! =======> 👀 [COLOR 2]
                              valueAdd40prColor2);
                          t40pr.clear();
                          c2R40pr.clear();
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
