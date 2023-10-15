import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher720p extends StatefulWidget {
  const AddWsher720p({super.key});

  @override
  State<AddWsher720p> createState() => _AddWsher720pState();
}

class _AddWsher720pState extends State<AddWsher720p> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty720p = 0;
  int valueAdd720pColor1 = 0;
  int valueAdd720pColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal720p = 0;
  int add720pcolor1 = 0;
  int add720pcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total720p = TextEditingController();
    TextEditingController w720pcolor1 = TextEditingController();
    TextEditingController w720pcolor2 = TextEditingController();

    var t720p = total720p;
    var c1R720p = w720pcolor1;
    var c2R720p = w720pcolor2;

    if (data.get('total720p') == null) {
      data.put('total720p', 0);
    }
    if (data.get('720pcolor1') == null) {
      data.put('720pcolor1', 0);
    }
    if (data.get('720pcolor2') == null) {
      data.put('720pcolor2', 0);
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
                          textController: total720p),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'SL Quantity',
                          textController: w720pcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'CH Quantity',
                          textController: w720pcolor2),
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
                        if (t720p.text.isEmpty &&
                            c1R720p.text.isEmpty &&
                            c2R720p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R720p.text.isEmpty && c2R720p.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t720p.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t720p.text.isEmpty && c2R720p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R720p.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t720p.text.isEmpty && c1R720p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R720p.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t720p.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R720p.clear();
                          c2R720p.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t720p.text.isNotEmpty &&
                            c1R720p.text.isNotEmpty &&
                            c2R720p.text.isNotEmpty) {
                          addtotal720p = int.parse(t720p.text);
                          add720pcolor1 = int.parse(c1R720p.text);
                          add720pcolor2 = int.parse(c2R720p.text);
                          if (valueAddQyantaty720p == 0) {
                            valueAddQyantaty720p = data.get(
                                'total720p'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty720p += addtotal720p;
                            data.put(
                                'total720p', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty720p);
                          }

                          if (valueAdd720pColor1 == 0) {
                            valueAdd720pColor1 = data.get(
                                '720pcolor1'); //!  ==========> 👀    COLOR 1
                            valueAdd720pColor1 += add720pcolor1;
                            data.put(
                                '720pcolor1', //! ========> 👀  COLOR 1
                                valueAdd720pColor1);
                          }

                          if (valueAdd720pColor2 == 0) {
                            valueAdd720pColor2 = data
                                .get('720pcolor2'); // ! =======> 👀    COLOR 2
                            valueAdd720pColor2 += add720pcolor2;
                            data.put(
                                '720pcolor2', //! =======>👀  COLOR 2
                                valueAdd720pColor2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total720p.clear();
                          w720pcolor1.clear();
                          w720pcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R720p.text.isEmpty) {
                          addtotal720p = int.parse(t720p.text);
                          if (valueAddQyantaty720p == 0) {
                            valueAddQyantaty720p = data.get(
                                'total720p'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty720p += addtotal720p;
                          data.put(
                              'total720p', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty720p);
                          add720pcolor1 = int.parse(c1R720p.text);
                          if (valueAdd720pColor1 == 0) {
                            valueAdd720pColor1 = data
                                .get('720pcolor1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd720pColor1 += add720pcolor1;
                          data.put(
                              '720pcolor1', //! =======> 👀  COLOR 1
                              valueAdd720pColor1);
                          t720p.clear();
                          c1R720p.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal720p = int.parse(t720p.text);
                          if (valueAddQyantaty720p == 0) {
                            valueAddQyantaty720p = data.get(
                                'total720p'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty720p += addtotal720p;
                          data.put(
                              'total720p', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty720p);
                          add720pcolor2 = int.parse(c2R720p.text);
                          if (valueAdd720pColor2 == 0) {
                            valueAdd720pColor2 = data
                                .get('720pcolor2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd720pColor2 += add720pcolor2;
                          data.put(
                              '720pcolor2', //! =======> 👀 COLOR 2
                              valueAdd720pColor2);
                          t720p.clear();
                          c2R720p.clear();
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
