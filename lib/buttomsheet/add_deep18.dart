import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddDeep18 extends StatefulWidget {
  const AddDeep18({super.key});

  @override
  State<AddDeep18> createState() => _AddDeep18State();
}

class _AddDeep18State extends State<AddDeep18> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantatyFreezer18 = 0;
  int valueAddColor1Freezer18 = 0;
  int valueAddColor2Freezer18 = 0;

  //! variables for names data box
  // String qua = 'total18';
  // String color1 = '18color1';
  // String color2 = '18color2';
  //! variables for parseing proccess at controller
  int addtotal18 = 0;
  int addcolor1f18 = 0;
  int addcolor2f18 = 0;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  validat() {
    var formdata = formkey.currentState!;
    if (formdata.validate()) {
      print('valid');
    } else {
      print('Not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController qut = TextEditingController();
    TextEditingController color1f18 = TextEditingController();
    TextEditingController color2f18 = TextEditingController();

    var t18 = qut;
    var c1f18 = color1f18;
    var c2f18 = color2f18;

    if (data.get('total18') == null) {
      data.put('total18', 0);
    }
    if (data.get('color1') == null) {
      data.put('colot1', 0);
    }
    if (data.get('color2') == null) {
      data.put('color2', 0);
    }
    //! =================== lottie function ===============================
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
                // ###########  ROW BODY ########### //
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Expanded(
                        child: component_buttom_sheet(
                      componentName: 'Total Quantity',
                      textController: qut,
                    )),
                    //  ########### column color quantaty #########
                    Expanded(
                        child: component_buttom_sheet(
                            componentName: 'SL Quantity',
                            textController: color1f18)),
                    // ############## column color quantaty ########
                    Expanded(
                        child: component_buttom_sheet(
                            componentName: 'CH Quantity',
                            textController: color2f18))
                  ],
                ),

                // ____________ sizedBox for Height __________

                SizedBox(
                  height: 150.h,
                ),
                // ________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                        if (t18.text.isEmpty &&
                            c1f18.text.isEmpty &&
                            c2f18.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/error-oops.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1f18.text.isEmpty && c2f18.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'you must choose at least one color.',
                              'Assets/lottie/error-oops.json');
                          t18.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t18.text.isEmpty && c2f18.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/error-oops.json');
                          c1f18.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t18.text.isEmpty && c1f18.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/error-oops.json');
                          c2f18.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t18.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/error-oops.json');
                          c1f18.clear();
                          c2f18.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t18.text.isNotEmpty &&
                            c1f18.text.isNotEmpty &&
                            c2f18.text.isNotEmpty) {
                          addtotal18 = int.parse(t18.text);
                          addcolor1f18 = int.parse(c1f18.text);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            if (data.get('total18') == null) {
                              data.put('total18', 0);
                            }
                            valueAddQyantatyFreezer18 = data.get('total18');
                            valueAddQyantatyFreezer18 += addtotal18;
                            data.put('total18', valueAddQyantatyFreezer18);
                          }

                          if (valueAddColor1Freezer18 == 0) {
                            if (data.get('color1') == null) {
                              data.put('color1', 0);
                            }
                            valueAddColor1Freezer18 = data.get('color1');
                            valueAddColor1Freezer18 += addcolor1f18;
                            data.put('color1', valueAddColor1Freezer18);
                          }

                          if (valueAddColor2Freezer18 == 0) {
                            if (data.get('color2') == null) {
                              data.put('color2', 0);
                            }
                            valueAddColor2Freezer18 = data.get('color2');
                            valueAddColor2Freezer18 += addcolor2f18;
                            data.put('color2', valueAddColor2Freezer18);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          qut.clear();
                          color1f18.clear();
                          color2f18.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2f18.text.isEmpty) {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put('total18', valueAddQyantatyFreezer18);
                          addcolor1f18 = int.parse(c1f18.text);
                          if (valueAddColor1Freezer18 == 0) {
                            valueAddColor1Freezer18 = data.get('color1');
                          }
                          valueAddColor1Freezer18 += addcolor1f18;
                          data.put('color1', valueAddColor1Freezer18);
                          t18.clear();
                          c1f18.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put('total18', valueAddQyantatyFreezer18);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddColor2Freezer18 == 0) {
                            valueAddColor2Freezer18 = data.get('color2');
                          }
                          valueAddColor2Freezer18 += addcolor2f18;
                          data.put('color2', valueAddColor2Freezer18);
                          t18.clear();
                          c2f18.clear();
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
