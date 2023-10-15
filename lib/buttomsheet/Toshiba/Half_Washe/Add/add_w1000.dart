import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher1000 extends StatefulWidget {
  const AddWsher1000({super.key});

  @override
  State<AddWsher1000> createState() => _AddWsher1000State();
}

class _AddWsher1000State extends State<AddWsher1000> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1000 = 0;
  int valueAdd1000Color1 = 0;
  int valueAdd1000Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1000 = 0;
  int add1000color1 = 0;
  int add1000color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1000 = TextEditingController();
    TextEditingController w1000color1 = TextEditingController();
    TextEditingController w1000color2 = TextEditingController();

    var t1000 = total1000;
    var c1R1000 = w1000color1;
    var c2R1000 = w1000color2;

    if (data.get('total1000') == null) {
      data.put('total1000', 0);
    }
    if (data.get('1000color1') == null) {
      data.put('1000color1', 0);
    }
    if (data.get('1000color2') == null) {
      data.put('1000color2', 0);
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
                          textController: total1000),
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
                          textController: w1000color1),
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
                          textController: w1000color2),
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
                        if (t1000.text.isEmpty &&
                            c1R1000.text.isEmpty &&
                            c2R1000.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R1000.text.isEmpty && c2R1000.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t1000.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t1000.text.isEmpty && c2R1000.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1000.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t1000.text.isEmpty && c1R1000.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R1000.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t1000.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R1000.clear();
                          c2R1000.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t1000.text.isNotEmpty &&
                            c1R1000.text.isNotEmpty &&
                            c2R1000.text.isNotEmpty) {
                          addtotal1000 = int.parse(t1000.text);
                          add1000color1 = int.parse(c1R1000.text);
                          add1000color2 = int.parse(c2R1000.text);
                          if (valueAddQyantaty1000 == 0) {
                            valueAddQyantaty1000 = data.get(
                                'total1000'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty1000 += addtotal1000;
                            data.put(
                                'total1000', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty1000);
                          }

                          if (valueAdd1000Color1 == 0) {
                            valueAdd1000Color1 = data.get(
                                '1000color1'); //!  ==========> 👀    COLOR 1
                            valueAdd1000Color1 += add1000color1;
                            data.put(
                                '1000color1', //! ========> 👀  COLOR 1
                                valueAdd1000Color1);
                          }

                          if (valueAdd1000Color2 == 0) {
                            valueAdd1000Color2 = data
                                .get('1000color2'); // ! =======> 👀    COLOR 2
                            valueAdd1000Color2 += add1000color2;
                            data.put(
                                '1000color2', //! =======>👀  COLOR 2
                                valueAdd1000Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total1000.clear();
                          w1000color1.clear();
                          w1000color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R1000.text.isEmpty) {
                          addtotal1000 = int.parse(t1000.text);
                          if (valueAddQyantaty1000 == 0) {
                            valueAddQyantaty1000 = data.get(
                                'total1000'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty1000 += addtotal1000;
                          data.put(
                              'total1000', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty1000);
                          add1000color1 = int.parse(c1R1000.text);
                          if (valueAdd1000Color1 == 0) {
                            valueAdd1000Color1 = data
                                .get('1000color1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd1000Color1 += add1000color1;
                          data.put(
                              '1000color1', //! =======> 👀  COLOR 1
                              valueAdd1000Color1);
                          t1000.clear();
                          c1R1000.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal1000 = int.parse(t1000.text);
                          if (valueAddQyantaty1000 == 0) {
                            valueAddQyantaty1000 = data.get(
                                'total1000'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty1000 += addtotal1000;
                          data.put(
                              'total1000', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty1000);
                          add1000color2 = int.parse(c2R1000.text);
                          if (valueAdd1000Color2 == 0) {
                            valueAdd1000Color2 = data
                                .get('1000color2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd1000Color2 += add1000color2;
                          data.put(
                              '1000color2', //! =======> 👀 COLOR 2
                              valueAdd1000Color2);
                          t1000.clear();
                          c2R1000.clear();
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
