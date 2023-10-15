import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef40ph extends StatefulWidget {
  const AddRef40ph({super.key});

  @override
  State<AddRef40ph> createState() => _AddRef40phState();
}

class _AddRef40phState extends State<AddRef40ph> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty40ph = 0;
  int valueAdd40phColor1 = 0;
  int valueAdd40phColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal40ph = 0;
  int add40phcolor1 = 0;
  int add40phcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total40ph = TextEditingController();
    TextEditingController r40phcolor1 = TextEditingController();
    TextEditingController r40phcolor2 = TextEditingController();

    var t40ph = total40ph;
    var c1R40ph = r40phcolor1;
    var c2R40ph = r40phcolor2;

    if (data.get('total40ph') == null) {
      data.put('total40ph', 0);
    }
    if (data.get('40phcolor1') == null) {
      data.put('40phcolor1', 0);
    }
    if (data.get('40phcolor2') == null) {
      data.put('40phcolor2', 0);
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
                          textController: total40ph),
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
                          textController: r40phcolor1),
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
                          textController: r40phcolor2),
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
                        if (t40ph.text.isEmpty &&
                            c1R40ph.text.isEmpty &&
                            c2R40ph.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R40ph.text.isEmpty && c2R40ph.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t40ph.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t40ph.text.isEmpty && c2R40ph.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40ph.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t40ph.text.isEmpty && c1R40ph.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R40ph.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t40ph.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R40ph.clear();
                          c2R40ph.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t40ph.text.isNotEmpty &&
                            c1R40ph.text.isNotEmpty &&
                            c2R40ph.text.isNotEmpty) {
                          addtotal40ph = int.parse(t40ph.text);
                          add40phcolor1 = int.parse(c1R40ph.text);
                          add40phcolor2 = int.parse(c2R40ph.text);
                          if (valueAddQyantaty40ph == 0) {
                            valueAddQyantaty40ph = data
                                .get('total40ph'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty40ph += addtotal40ph;
                            data.put(
                                'total40ph', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty40ph);
                          }

                          if (valueAdd40phColor1 == 0) {
                            valueAdd40phColor1 = data.get(
                                '40phcolor1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd40phColor1 += add40phcolor1;
                            data.put(
                                '40phcolor1', //! ========> 👀 [ COLOR 1]
                                valueAdd40phColor1);
                          }

                          if (valueAdd40phColor2 == 0) {
                            valueAdd40phColor2 = data
                                .get('40phcolor2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd40phColor2 += add40phcolor2;
                            data.put(
                                '40phcolor2', //! =======>👀 [ COLOR 2]
                                valueAdd40phColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total40ph.clear();
                          r40phcolor1.clear();
                          r40phcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R40ph.text.isEmpty) {
                          addtotal40ph = int.parse(t40ph.text);
                          if (valueAddQyantaty40ph == 0) {
                            valueAddQyantaty40ph = data
                                .get('total40ph'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty40ph += addtotal40ph;
                          data.put(
                              'total40ph', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty40ph);
                          add40phcolor1 = int.parse(c1R40ph.text);
                          if (valueAdd40phColor1 == 0) {
                            valueAdd40phColor1 = data
                                .get('40phcolor1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd40phColor1 += add40phcolor1;
                          data.put(
                              '40phcolor1', //! =======> 👀 [ COLOR 1]
                              valueAdd40phColor1);
                          t40ph.clear();
                          c1R40ph.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal40ph = int.parse(t40ph.text);
                          if (valueAddQyantaty40ph == 0) {
                            valueAddQyantaty40ph =
                                data.get('total40ph'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty40ph += addtotal40ph;
                          data.put(
                              'total40ph', //! =======> 👀 [TOTAL]
                              valueAddQyantaty40ph);
                          add40phcolor2 = int.parse(c2R40ph.text);
                          if (valueAdd40phColor2 == 0) {
                            valueAdd40phColor2 = data
                                .get('40phcolor2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd40phColor2 += add40phcolor2;
                          data.put(
                              '40phcolor2', //! =======> 👀 [COLOR 2]
                              valueAdd40phColor2);
                          t40ph.clear();
                          c2R40ph.clear();
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
