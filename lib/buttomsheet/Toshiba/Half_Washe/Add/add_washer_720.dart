import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher720 extends StatefulWidget {
  const AddWsher720({super.key});

  @override
  State<AddWsher720> createState() => _AddWsher720State();
}

class _AddWsher720State extends State<AddWsher720> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty720 = 0;
  int valueAdd720Color1 = 0;
  int valueAdd720Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal720 = 0;
  int add720color1 = 0;
  int add720color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total720 = TextEditingController();
    TextEditingController w720color1 = TextEditingController();
    TextEditingController w720color2 = TextEditingController();

    var t720 = total720;
    var c1R720 = w720color1;
    var c2R720 = w720color2;

    if (data.get('total720') == null) {
      data.put('total720', 0);
    }
    if (data.get('720color1') == null) {
      data.put('720color1', 0);
    }
    if (data.get('720color2') == null) {
      data.put('720color2', 0);
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
                          textController: total720),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'SL Quantity',
                          textController: w720color1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'CH Quantity',
                          textController: w720color2),
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
                        if (t720.text.isEmpty &&
                            c1R720.text.isEmpty &&
                            c2R720.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R720.text.isEmpty && c2R720.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t720.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t720.text.isEmpty && c2R720.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R720.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t720.text.isEmpty && c1R720.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R720.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t720.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R720.clear();
                          c2R720.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t720.text.isNotEmpty &&
                            c1R720.text.isNotEmpty &&
                            c2R720.text.isNotEmpty) {
                          addtotal720 = int.parse(t720.text);
                          add720color1 = int.parse(c1R720.text);
                          add720color2 = int.parse(c2R720.text);
                          if (valueAddQyantaty720 == 0) {
                            valueAddQyantaty720 = data.get(
                                'total720'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty720 += addtotal720;
                            data.put(
                                'total720', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty720);
                          }

                          if (valueAdd720Color1 == 0) {
                            valueAdd720Color1 = data.get(
                                '720color1'); //!  ==========> 👀    COLOR 1
                            valueAdd720Color1 += add720color1;
                            data.put(
                                '720color1', //! ========> 👀  COLOR 1
                                valueAdd720Color1);
                          }

                          if (valueAdd720Color2 == 0) {
                            valueAdd720Color2 = data
                                .get('720color2'); // ! =======> 👀    COLOR 2
                            valueAdd720Color2 += add720color2;
                            data.put(
                                '720color2', //! =======>👀  COLOR 2
                                valueAdd720Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total720.clear();
                          w720color1.clear();
                          w720color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R720.text.isEmpty) {
                          addtotal720 = int.parse(t720.text);
                          if (valueAddQyantaty720 == 0) {
                            valueAddQyantaty720 = data.get(
                                'total720'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty720 += addtotal720;
                          data.put(
                              'total720', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty720);
                          add720color1 = int.parse(c1R720.text);
                          if (valueAdd720Color1 == 0) {
                            valueAdd720Color1 =
                                data.get('720color1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd720Color1 += add720color1;
                          data.put(
                              '720color1', //! =======> 👀  COLOR 1
                              valueAdd720Color1);
                          t720.clear();
                          c1R720.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal720 = int.parse(t720.text);
                          if (valueAddQyantaty720 == 0) {
                            valueAddQyantaty720 = data.get(
                                'total720'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty720 += addtotal720;
                          data.put(
                              'total720', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty720);
                          add720color2 = int.parse(c2R720.text);
                          if (valueAdd720Color2 == 0) {
                            valueAdd720Color2 =
                                data.get('720color2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd720Color2 += add720color2;
                          data.put(
                              '720color2', //! =======> 👀 COLOR 2
                              valueAdd720Color2);
                          t720.clear();
                          c2R720.clear();
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
