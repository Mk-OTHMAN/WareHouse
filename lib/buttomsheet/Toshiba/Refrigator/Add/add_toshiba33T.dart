import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class Tosh33t extends StatefulWidget {
  const Tosh33t({super.key});

  @override
  State<Tosh33t> createState() => _Tosh33tState();
}

class _Tosh33tState extends State<Tosh33t> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty33T = 0;
  int valueAdd33TColor1 = 0;
  int valueAdd33TColor2 = 0;
  //! variables for parseing proccess at controller
  int addtotal33T = 0;
  int add33Tcolor1 = 0;
  int add33Tcolor2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total33T = TextEditingController();
    TextEditingController r33Tcolor1 = TextEditingController();
    TextEditingController r33Tcolor2 = TextEditingController();

    var t33T = total33T;
    var c1R33T = r33Tcolor1;
    var c2R33T = r33Tcolor2;

    if (data.get('total33T') == null) {
      data.put('total33T', 0);
    }
    if (data.get('33Tcolor1') == null) {
      data.put('33Tcolor1', 0);
    }
    if (data.get('33Tcolor2') == null) {
      data.put('33Tcolor2', 0);
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
                          textController: total33T),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'SL Quantity',
                          textController: r33Tcolor1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
                      child: ComponentButtomSheet(
                          componentName: 'CH Quantity',
                          textController: r33Tcolor2),
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
                        if (t33T.text.isEmpty &&
                            c1R33T.text.isEmpty &&
                            c2R33T.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R33T.text.isEmpty && c2R33T.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t33T.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t33T.text.isEmpty && c2R33T.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R33T.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t33T.text.isEmpty && c1R33T.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R33T.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t33T.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R33T.clear();
                          c2R33T.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t33T.text.isNotEmpty &&
                            c1R33T.text.isNotEmpty &&
                            c2R33T.text.isNotEmpty) {
                          addtotal33T = int.parse(t33T.text);
                          add33Tcolor1 = int.parse(c1R33T.text);
                          add33Tcolor2 = int.parse(c2R33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =========> 👀
                            valueAddQyantaty33T += addtotal33T;
                            data.put(
                                'total33T', valueAddQyantaty33T); //! =====> 👀
                          }

                          if (valueAdd33TColor1 == 0) {
                            valueAdd33TColor1 =
                                data.get('33Tcolor1'); //!  ==========> 👀
                            valueAdd33TColor1 += add33Tcolor1;
                            data.put(
                                '33Tcolor1', //! ========> 👀
                                valueAdd33TColor1);
                          }

                          if (valueAdd33TColor2 == 0) {
                            valueAdd33TColor2 =
                                data.get('33Tcolor2'); // ! =======> 👀
                            valueAdd33TColor2 += add33Tcolor2;
                            data.put(
                                '33Tcolor2', valueAdd33TColor2); //! =======>👀
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total33T.clear();
                          r33Tcolor1.clear();
                          r33Tcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R33T.text.isEmpty) {
                          addtotal33T = int.parse(t33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =========> 👀
                          }
                          valueAddQyantaty33T += addtotal33T;
                          data.put(
                              'total33T', valueAddQyantaty33T); //! ======> 👀
                          add33Tcolor1 = int.parse(c1R33T.text);
                          if (valueAdd33TColor1 == 0) {
                            valueAdd33TColor1 =
                                data.get('33Tcolor1'); //! =======> 👀
                          }
                          valueAdd33TColor1 += add33Tcolor1;
                          data.put(
                              '33Tcolor1', valueAdd33TColor1); //! =======> 👀
                          t33T.clear();
                          c1R33T.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal33T = int.parse(t33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =======> 👀
                          }
                          valueAddQyantaty33T += addtotal33T;
                          data.put(
                              'total33T', valueAddQyantaty33T); //! =======> 👀
                          add33Tcolor2 = int.parse(c2R33T.text);
                          if (valueAdd33TColor2 == 0) {
                            valueAdd33TColor2 =
                                data.get('33Tcolor2'); //! =======> 👀
                          }
                          valueAdd33TColor2 += add33Tcolor2;
                          data.put(
                              '33Tcolor2', valueAdd33TColor2); //! =======> 👀
                          t33T.clear();
                          c2R33T.clear();
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
