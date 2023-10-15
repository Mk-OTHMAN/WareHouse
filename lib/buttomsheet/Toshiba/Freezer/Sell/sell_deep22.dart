import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellDeep22 extends StatefulWidget {
  const SellDeep22({super.key});

  @override
  State<SellDeep22> createState() => _SellDeep22State();
}

class _SellDeep22State extends State<SellDeep22> {
  Box data = Hive.box('data');
  int valueDeleteQuantatyFreezer22 = 0;
  int valueDeleteColor1Freezer22 = 0;
  int valueDeleteColor2Freezer22 = 0;
  TextEditingController deleteFreezer22Quantaty = TextEditingController();
  TextEditingController deleteFreezer22Color1Quntaty = TextEditingController();
  TextEditingController deleteFreezer22Color2Quantaty = TextEditingController();
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
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text('Sell',
                style: GoogleFonts.rowdies(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold)),
            // ________  Row body for text form field ______ //
            SizedBox(height: 25.h),
            Row(
              children: [
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'Total Quantity',
                        textController: deleteFreezer22Quantaty)),

                //  ########### column color quantaty #########

                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'SL Quantity',
                        textController: deleteFreezer22Color1Quntaty)),

                // ############## column coolor quantaty ########
                Expanded(
                    child: ComponentButtomSheet(
                        componentName: 'CH Quantity',
                        textController: deleteFreezer22Color2Quantaty))
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    // __________ check if Quantaty & color 1 & Color 2 Empty _______ //
                    if (deleteFreezer22Quantaty.text.isEmpty &&
                        deleteFreezer22Color1Quntaty.text.isEmpty &&
                        deleteFreezer22Color2Quantaty.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                          'Assets/lottie/Robot.json');
                    }
                    // __________________  case delete at one time 3*1 _________
                    else if (deleteFreezer22Quantaty.text.isNotEmpty &&
                        deleteFreezer22Color1Quntaty.text.isNotEmpty &&
                        deleteFreezer22Color2Quantaty.text.isNotEmpty) {
                      int deletequantaty =
                          int.parse(deleteFreezer22Quantaty.text);
                      int deletecolor1 =
                          int.parse(deleteFreezer22Color1Quntaty.text);
                      int deletecolor2 =
                          int.parse(deleteFreezer22Color2Quantaty.text);
                      if (deletequantaty > data.get('freezer22Quantaty') &&
                              data.get('freezer22Quantaty') >= 0 ||
                          deletecolor1 > data.get('freezer22color1') &&
                              data.get('freezer22color1') >= 0 ||
                          deletecolor2 > data.get('freezer22color2') &&
                              data.get('freezer22color2') >= 0) {
                        showDialogFunction(
                            'WRONG',
                            'please check on the total Quantity and colors Quantity',
                            'Assets/lottie/Robot.json');
                        deleteFreezer22Quantaty.clear();
                        deleteFreezer22Color1Quntaty.clear();
                        deleteFreezer22Color2Quantaty.clear();
                      } else {
                        valueDeleteQuantatyFreezer22 =
                            data.get('freezer22Quantaty') - deletequantaty;
                        data.put(
                            'freezer22Quantaty', valueDeleteQuantatyFreezer22);
                        valueDeleteColor1Freezer22 =
                            data.get('freezer22color1') - deletecolor1;
                        data.put('freezer22color1', valueDeleteColor1Freezer22);
                        valueDeleteColor2Freezer22 =
                            data.get('freezer22color2') - deletecolor2;
                        data.put('freezer22color2', valueDeleteColor2Freezer22);

                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to remove the product',
                            'Assets/lottie/DoneGreen.json');
                        deleteFreezer22Quantaty.clear();
                        deleteFreezer22Color1Quntaty.clear();
                        deleteFreezer22Color2Quantaty.clear();
                      }
                    }
                    // _______ chek if recived from user Quantaty only ________ //
                    else if (deleteFreezer22Color1Quntaty.text.isEmpty &&
                        deleteFreezer22Color2Quantaty.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          'you must choose at least one color.',
                          'Assets/lottie/Robot.json');
                      deleteFreezer22Quantaty.clear();
                    }
                    // __________ check if recived from user color 1 only ________ //
                    else if (deleteFreezer22Quantaty.text.isEmpty &&
                        deleteFreezer22Color2Quantaty.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      deleteFreezer22Color1Quntaty.clear();
                    }
                    // ________ chek if recived from user color 2 only _________ //
                    else if (deleteFreezer22Quantaty.text.isEmpty &&
                        deleteFreezer22Color1Quntaty.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      deleteFreezer22Color2Quantaty.clear();
                    }
                    // _____________ Check if user write input in color 1 and color 2 only _______ //
                    else if (deleteFreezer22Quantaty.text.isEmpty) {
                      showDialogFunction(
                          'WRONG',
                          "you must choose the Quantity,that's wrong add color only",
                          'Assets/lottie/Robot.json');
                      deleteFreezer22Color1Quntaty.clear();
                      deleteFreezer22Color2Quantaty.clear();
                    }

                    // _____________ Check All Quantaty And input from User _________ //
                    else {
                      if (data.get('freezer22Quantaty') == 0) {
                        int deletequantaty =
                            int.parse(deleteFreezer22Quantaty.text);
                        if (deletequantaty > data.get('freezer22Quantaty')) {
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on total Quantity',
                              'Assets/lottie/Robot.json');
                          deleteFreezer22Quantaty.clear();
                          deleteFreezer22Color1Quntaty.clear();
                        }
                      }
                      // ____________ Check Color 1 Quantaty And input frpm User ______________ //
                      else if (data.get('freezer22color1') == 0 &&
                          data.get('freezer22color1') > 0) {
                        int deletecolor1 =
                            int.parse(deleteFreezer22Color1Quntaty.text);
                        if (deletecolor1 > data.get('freezer22color1') &&
                            data.get('freezer22color1') > 0) {
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color Quantity',
                              'Assets/lottie/Robot.json');
                        }
                        deleteFreezer22Color1Quntaty.clear();
                      }
                      // ___________ Check Color 2 Quantaty And input from User _____________
                      else if (data.get('freezer22color2') == 0 &&
                          data.get('freezer22color2') > 0) {
                        int deletecolor2 =
                            int.parse(deleteFreezer22Color2Quantaty.text);
                        if (deletecolor2 > data.get('freezer22color2') &&
                            data.get('freezer22color2') > 0) {
                          showDialogFunction(
                              'WRONG',
                              'sorry, the number is greater than the stored quantity,please check on color Quantity',
                              'Assets/lottie/Robot.json');
                        }
                      }
                      // ___________ Case Delete From All Qantaty And Color 1 Proccess
                      else if (deleteFreezer22Color2Quantaty.text.isEmpty) {
                        if (data.get('freezer22Quantaty') > 0 ||
                            data.get('freezer22color1') > 0) {
                          int deletequantaty =
                              int.parse(deleteFreezer22Quantaty.text);
                          int deletecolor1 =
                              int.parse(deleteFreezer22Color1Quntaty.text);

                          if (deletequantaty > data.get('freezer22Quantaty') ||
                              deletecolor1 > data.get('freezer22color1')) {
                            showDialogFunction(
                                'WRONG',
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                                'Assets/lottie/Robot.json');
                            // deleteFreezer22Quantaty.clear();
                            // deleteFreezer22Color1Quntaty.clear();
                          } else {
                            int deletequantaty = // ### remeber explosion code @@@@@@@@

                                int.parse(deleteFreezer22Quantaty.text);
                            int deletecolor1 =
                                int.parse(deleteFreezer22Color1Quntaty.text);
                            valueDeleteQuantatyFreezer22 =
                                data.get('freezer22Quantaty') - deletequantaty;
                            data.put('freezer22Quantaty',
                                valueDeleteQuantatyFreezer22);
                            // deleteFreezer22Quantaty.clear();

                            valueDeleteColor1Freezer22 =
                                data.get('freezer22color1') - deletecolor1;
                            data.put(
                                'freezer22color1', valueDeleteColor1Freezer22);

                            // deleteFreezer22Color1Quntaty.clear();

                            showDialogFunction(
                                'DONE',
                                'success process, and well done for remembering to delete the product',
                                'Assets/lottie/DoneGreen.json');
                          }
                        }
                        deleteFreezer22Quantaty.clear();
                        deleteFreezer22Color1Quntaty.clear();
                      }

                      // _______________ Case All Quantaty delete Proccess And Color 2 __________ //
                      else if (deleteFreezer22Color1Quntaty.text.isEmpty) {
                        if (data.get('freezer22Quantaty') > 0 ||
                            data.get('freezer22color2') > 0) {
                          int deletequantaty =
                              int.parse(deleteFreezer22Quantaty.text);
                          int deletecolor2 =
                              int.parse(deleteFreezer22Color2Quantaty.text);
                          if (deletequantaty > data.get('freezer22Quantaty') ||
                              deletecolor2 > data.get('freezer22color2')) {
                            showDialogFunction(
                                'WRONG',
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity',
                                'Assets/lottie/Robot.json');
                            deleteFreezer22Quantaty.clear();
                            deleteFreezer22Color2Quantaty.clear();
                          } else {
                            int deletequantaty =
                                int.parse(deleteFreezer22Quantaty.text);
                            int deletecolor2 =
                                int.parse(deleteFreezer22Color2Quantaty.text);
                            valueDeleteQuantatyFreezer22 =
                                data.get('freezer22Quantaty') - deletequantaty;
                            data.put('freezer22Quantaty',
                                valueDeleteQuantatyFreezer22);
                            deleteFreezer22Quantaty.clear();

                            valueDeleteColor2Freezer22 =
                                data.get('freezer22color2') - deletecolor2;
                            data.put(
                                'freezer22color2', valueDeleteColor2Freezer22);

                            deleteFreezer22Color2Quantaty.clear();
                            showDialogFunction(
                                'DONE',
                                'success process, and well done for remembering to delete the product',
                                'Assets/lottie/DoneGreen.json');
                          }
                        }
                      }
                      deleteFreezer22Quantaty.clear();
                      deleteFreezer22Color2Quantaty.clear();
                    }
                  });
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }
}
