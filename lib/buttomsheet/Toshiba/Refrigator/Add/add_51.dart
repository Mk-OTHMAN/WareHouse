import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef51 extends StatefulWidget {
  const AddRef51({super.key});

  @override
  State<AddRef51> createState() => _AddRef51State();
}

class _AddRef51State extends State<AddRef51> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty51 = 0;
  int valueAdd51Color1 = 0;
  int valueAdd51Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal51 = 0;
  int add51color1 = 0;
  int add51color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total51 = TextEditingController();
    TextEditingController r51color1 = TextEditingController();
    TextEditingController r51color2 = TextEditingController();

    var t51 = total51;
    var c1R51 = r51color1;
    var c2R51 = r51color2;

    if (data.get('total51') == null) {
      data.put('total51', 0);
    }
    if (data.get('51color1') == null) {
      data.put('51color1', 0);
    }
    if (data.get('51color2') == null) {
      data.put('51color2', 0);
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
                          textController: total51),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
                      child: component_buttom_sheet(
                          componentName: 'SL Quantity',
                          textController: r51color1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
                      child: component_buttom_sheet(
                          componentName: 'CH Quantity',
                          textController: r51color2),
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
                        if (t51.text.isEmpty &&
                            c1R51.text.isEmpty &&
                            c2R51.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R51.text.isEmpty && c2R51.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t51.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t51.text.isEmpty && c2R51.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R51.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t51.text.isEmpty && c1R51.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R51.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t51.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R51.clear();
                          c2R51.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t51.text.isNotEmpty &&
                            c1R51.text.isNotEmpty &&
                            c2R51.text.isNotEmpty) {
                          addtotal51 = int.parse(t51.text);
                          add51color1 = int.parse(c1R51.text);
                          add51color2 = int.parse(c2R51.text);
                          if (valueAddQyantaty51 == 0) {
                            valueAddQyantaty51 = data.get(
                                'total51'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty51 += addtotal51;
                            data.put(
                                'total51', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty51);
                          }

                          if (valueAdd51Color1 == 0) {
                            valueAdd51Color1 = data
                                .get('51color1'); //!  ==========> 👀    COLOR 1
                            valueAdd51Color1 += add51color1;
                            data.put(
                                '51color1', //! ========> 👀  COLOR 1
                                valueAdd51Color1);
                          }

                          if (valueAdd51Color2 == 0) {
                            valueAdd51Color2 = data
                                .get('51color2'); // ! =======> 👀    COLOR 2
                            valueAdd51Color2 += add51color2;
                            data.put(
                                '51color2', //! =======>👀  COLOR 2
                                valueAdd51Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total51.clear();
                          r51color1.clear();
                          r51color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R51.text.isEmpty) {
                          addtotal51 = int.parse(t51.text);
                          if (valueAddQyantaty51 == 0) {
                            valueAddQyantaty51 = data.get(
                                'total51'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty51 += addtotal51;
                          data.put(
                              'total51', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty51);
                          add51color1 = int.parse(c1R51.text);
                          if (valueAdd51Color1 == 0) {
                            valueAdd51Color1 =
                                data.get('51color1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd51Color1 += add51color1;
                          data.put(
                              '51color1', //! =======> 👀  COLOR 1
                              valueAdd51Color1);
                          t51.clear();
                          c1R51.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal51 = int.parse(t51.text);
                          if (valueAddQyantaty51 == 0) {
                            valueAddQyantaty51 = data
                                .get('total51'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty51 += addtotal51;
                          data.put(
                              'total51', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty51);
                          add51color2 = int.parse(c2R51.text);
                          if (valueAdd51Color2 == 0) {
                            valueAdd51Color2 =
                                data.get('51color2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd51Color2 += add51color2;
                          data.put(
                              '51color2', //! =======> 👀 COLOR 2
                              valueAdd51Color2);
                          t51.clear();
                          c2R51.clear();
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
