import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddDeep22 extends StatefulWidget {
  const AddDeep22({super.key});

  @override
  State<AddDeep22> createState() => _AddDeep22State();
}

class _AddDeep22State extends State<AddDeep22> {
  Box data = Hive.box('data');
  int valueAddQyantatyFreezer22 = 0;
  int valueAddColor1Freezer22 = 0;
  int valueAddColor2Freezer22 = 0;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController freezer22Quntaty = TextEditingController();
  TextEditingController frezzer22Color1Quantaty = TextEditingController();
  TextEditingController freezer22Color2Quantaty = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
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
                //! ________  ROW BODY ___________
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Expanded(
                        child: component_buttom_sheet(
                            componentName: 'Total Quantity',
                            textController: freezer22Quntaty)),
                    // ! ________ sl quantity _________
                    Expanded(
                        child: component_buttom_sheet(
                            componentName: 'SL Quantity',
                            textController: frezzer22Color1Quantaty)),

                    //! _______  ch quantity __________
                    Expanded(
                        child: component_buttom_sheet(
                            componentName: 'CH Quantity',
                            textController: freezer22Color2Quantaty))
                  ],
                ),
                //! ____________ sizedBox for Height __________
                SizedBox(
                  height: 150.h,
                ),
                //! ________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        // _______ Check Quantaty & Color 1 & Color2 is Empty _____ //
                        if (freezer22Quntaty.text.isEmpty &&
                            frezzer22Color1Quantaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/error-oops.json');
                          //_________ case add at one time 3*1 _____________
                        } else if (freezer22Quntaty.text.isNotEmpty &&
                            frezzer22Color1Quantaty.text.isNotEmpty &&
                            freezer22Color2Quantaty.text.isNotEmpty) {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          int addColor1Freezer22 =
                              int.parse(frezzer22Color1Quantaty.text);
                          int addColor2Freezer22 =
                              int.parse(freezer22Color2Quantaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                            valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                            data.put(
                                'freezer22Quantaty', valueAddQyantatyFreezer22);
                          }

                          if (valueAddColor1Freezer22 == 0) {
                            valueAddColor1Freezer22 =
                                data.get('freezer22color1');
                            valueAddColor1Freezer22 += addColor1Freezer22;
                            data.put(
                                'freezer22color1', valueAddColor1Freezer22);
                          }

                          if (valueAddColor2Freezer22 == 0) {
                            valueAddColor2Freezer22 =
                                data.get('freezer22color2');
                            valueAddColor2Freezer22 += addColor2Freezer22;
                            data.put(
                                'freezer22color2', valueAddColor2Freezer22);
                          }

                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          freezer22Quntaty.clear();
                          frezzer22Color1Quantaty.clear();
                          freezer22Color2Quantaty.clear();
                        }
                        // ________ Check if user write in Quantaty Only ________ //
                        else if (frezzer22Color1Quantaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'you must choose at least one color.',
                              'Assets/lottie/error-oops.json');
                          freezer22Quntaty.clear();
                        }
                        // ________ Check if user write in Color 1 Only _______ //
                        else if (freezer22Quntaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/error-oops.json');
                          frezzer22Color1Quantaty.clear();
                        }
                        // ________ check if user write in color 2 only _________ //
                        else if (freezer22Quntaty.text.isEmpty &&
                            frezzer22Color1Quantaty.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/error-oops.json');
                          freezer22Color2Quantaty.clear();
                        }
                        // _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (freezer22Quntaty.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/error-oops.json');
                          frezzer22Color1Quantaty.clear();
                          freezer22Color2Quantaty.clear();
                        }
                        // _________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (freezer22Color2Quantaty.text.isEmpty) {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            if (data.get('freezer22Qantaty') == null) {
                              data.put('freezer22Qantaty', 0);
                            }
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                          }
                          valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                          data.put(
                              'freezer22Quantaty', valueAddQyantatyFreezer22);
                          int addColor1Freezer22 =
                              int.parse(frezzer22Color1Quantaty.text);
                          if (valueAddColor1Freezer22 == 0) {
                            if (data.get('freezer22color1') == null) {
                              data.put('freezer22color1', 0);
                            }
                            valueAddColor1Freezer22 =
                                data.get('freezer22color1');
                          }
                          valueAddColor1Freezer22 += addColor1Freezer22;
                          data.put('freezer22color1', valueAddColor1Freezer22);
                          freezer22Quntaty.clear();
                          frezzer22Color1Quantaty.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // _________ Add Proccess for All Quantaty & Color 2 Proccess ________ //
                        else {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                          }
                          valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                          data.put(
                              'freezer22Quantaty', valueAddQyantatyFreezer22);
                          int addColor2Freezer22 =
                              int.parse(freezer22Color2Quantaty.text);
                          if (valueAddColor2Freezer22 == 0) {
                            if (data.get('freezer22color2') == null) {
                              data.put('freezer22color2', 0);
                            }
                            valueAddColor2Freezer22 =
                                data.get('freezer22color2');
                          }
                          valueAddColor2Freezer22 += addColor2Freezer22;
                          data.put('freezer22color2', valueAddColor2Freezer22);
                          freezer22Quntaty.clear();
                          freezer22Color2Quantaty.clear();
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

        // ______________ seconde container ____________
      ],
    );
  }
}
